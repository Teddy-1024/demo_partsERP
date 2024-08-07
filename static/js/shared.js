// Shared JS file names: routing, main, shared, localStorage, appDialogs
const _dataLoadingFlag = 'data-loading'
var _verbose = true;
var hashPageCurrent;

function hookupShared() {
    // hookupVideos();
    hookupNavigation();
    /*
    $(idOverlayHamburger).removeClass(flagCollapsed);
    $(idOverlayHamburger).addClass(flagExpanded);
    */

    let imgLogo = $($("img.header-logo")[0]);
    initialiseEventHandler(imgLogo, flagInitialised, function() {
        imgLogo.on("click", function(event) {
            event.stopPropagation();
            goToPage(hashPageHome);
        });
    });
}

function hookupNavigation() {
    console.log("hooking up navigation");

    let overlayHamburger = $(idOverlayHamburger);
    countOptions = overlayHamburger.find('div.' + flagRow).length;
    console.log('count nav options: ', countOptions);
    overlayHamburger.css('height', (countOptions * 27) + 'px');

    let buttonHamburger = $(idButtonHamburger);
    initialiseEventHandler(buttonHamburger, flagInitialised, function() {
        buttonHamburger.on("click", function(event) {
            event.stopPropagation();
            let overlayHamburger = $(idOverlayHamburger);
            if (overlayHamburger.hasClass(flagCollapsed)) {
                overlayHamburger.removeClass(flagCollapsed);
                overlayHamburger.addClass(flagExpanded);
            } else {
                overlayHamburger.removeClass(flagExpanded);
                overlayHamburger.addClass(flagCollapsed);
            }
        });
    });

    let btnNavHome = $(idNavHome);
    initialiseEventHandler(btnNavHome, flagInitialised, function() {
        btnNavHome.on("click", function(event) {
            event.stopPropagation();
            // setupPageLocalStorageNext(hashPageStoreHome);
            goToPage(hashPageHome);
        });
    });
    
    let btnNavServices = $(idNavServices);
    initialiseEventHandler(btnNavServices, flagInitialised, function() {
        btnNavServices.on("click", function(event) {
            event.stopPropagation();
            goToPage(hashPageServices);
        });
    });
    
    let btnNavContact = $(idNavContact);
    initialiseEventHandler(btnNavContact, flagInitialised, function() {
        btnNavContact.on("click", function(event) {
            event.stopPropagation();
            // setupPageLocalStorageNext(hashPageStoreHome);
            goToPage(hashPageContact);
        });
    });
    
    let btnNavUserAccount = $(idNavUserAccount);
    initialiseEventHandler(btnNavUserAccount, flagInitialised, function() {
        btnNavUserAccount.on("click", function(event) {
            event.stopPropagation();
            goToPage(hashPageUserAccount);
        });
    });
    
    let btnNavUserLogout = $(idNavUserLogout);
    initialiseEventHandler(btnNavUserLogout, flagInitialised, function() {
        btnNavUserLogout.on("click", function(event) {
            event.stopPropagation();
            goToPage(hashPageUserLogout);
        });
    });
    
    let btnNavUserLogin = $(idNavUserLogin);
    initialiseEventHandler(btnNavUserLogin, flagInitialised, function() {
        btnNavUserLogin.on("click", function(event) {
            event.stopPropagation();
            // goToPage(hashPageUserLogin);
            ajaxData = {};
            ajaxData[keyCallback] = hashPageCurrent;
            console.log('sending data to user login controller: '); console.log(ajaxData);
            ajaxJSONData('Login user', mapHashToController(hashPageUserLogin), ajaxData, function(response) {
                if (response.Success) {
                    goToUrl(response[keyCallback]);
                } else {
                    alertError("Error", response.Message);
                }
            }, false);
        });
    });
    
    
    let btnNavStoreHome = $(idNavStoreHome);
    console.log("hooking up store home");
    console.log("btn: ", btnNavStoreHome, "\nHash: ", hashPageStoreHome, "\nflag: ", flagInitialised);
    initialiseEventHandler(btnNavStoreHome, flagInitialised, function() {
        console.log("hooking up store home");
        console.log("btn: ", btnNavStoreHome, "\nHash: ", hashPageStoreHome);
        btnNavStoreHome.on("click", function(event) {
            event.stopPropagation();
            // setupPageLocalStorageNext(hashPageStoreHome);
            goToPage(hashPageStoreHome);
        });
    });

    let btnNavStorePermutations = $(idNavStorePermutations);
    initialiseEventHandler(btnNavStorePermutations, flagInitialised, function() {
        btnNavStorePermutations.on("click", function(event) {
            event.stopPropagation();
            // setupPageLocalStorageNext(hashPageStoreHome);
            goToPage(hashPageStorePermutations);
        });
    });

   
    try 
    {
        hookupSelectorCurrency();
        hookupSelectorDeliveryRegion();
        hookupCheckboxIsIncludedVAT();
    }
    catch {}
    
}

function hookupOverlay(idOverlay) {

    initialiseEventHandler(idOverlay, flagInitialised, function() {

        let overlay = $(idOverlay)
        
        // close button
        overlay.find('button.' + flagBtnOverlayClose).on("click", function(event) {
            overlay.css('display', 'none');
        });
    });
}

function hookupSelectorCurrency() {
    /*
    let elForm = $(idFormCurrency);
    let elSelector = $(elForm.find('select')[0]);
    initialiseEventHandler(elSelector, flagInitialised, function(){
        elForm = $(idFormCurrency);
        elSelector.on("change", function(event) {
            ajaxData = {};
            ajaxData[keyForm] = convertForm2JSON(elForm);
            console.log('sending data to currency selector controller: '); console.log(ajaxData);
            ajaxJSONData('select currency', mapHashToController(hashStoreSelectCurrency), ajaxData, function() { window.location.reload() }, false);

            let optionSelected = elSelector.options[elSelector.selectedIndex]
            let textSelected = optionSelected.attr(attrDataShort)
            
        });
    });
    console.log("form currency initialised")
    */

    let dropdownCurrency = $(idCurrency)[0];
    // dropdownCurrency.options.map(function(option) {
    let option, indexHyphen, textOption;
    for (let indexOption = 0; indexOption < dropdownCurrency.options.length; indexOption++) {
        option = $(dropdownCurrency.options[indexOption]);
        textOption = option.text();
        indexHyphen = textOption.indexOf('-');
        option.attr(attrTextExpanded, textOption);
        option.attr(attrTextCollapsed, textOption.substring(0, indexHyphen - 1));
        option.addClass(flagCollapsed);
    }
    handleSelectCollapse(dropdownCurrency);
    initialiseEventHandler(dropdownCurrency, flagInitialised, function() {
        dropdownCurrency = $(dropdownCurrency);
        dropdownCurrency.on("focus", function() {
            handleSelectExpand(dropdownCurrency);
        });
        dropdownCurrency.on("blur", function() {
            handleSelectCollapse(dropdownCurrency);
        });
        dropdownCurrency.on("change", function() {
            let selectedCurrency = dropdownCurrency.val();
            console.log("selected currency: ", selectedCurrency);
            let basket = getLocalStorage(keyBasket);
            basket[keyIdCurrency] = selectedCurrency;
            // setLocalStorage(keyIdCurrency, selectedCurrency);
            setLocalStorage(keyBasket, basket);
            let ajaxData = {};
            ajaxData[keyBasket] = basket;
            ajaxJSONData('update currency', mapHashToController(hashPageCurrent), ajaxData, loadPageBody, false);
        });
    });
}

function hookupSelectorDeliveryRegion() {
    /*
    let elForm = $(idFormDeliveryRegion);
    let elSelector = $(elForm.find('select')[0]);
    initialiseEventHandler(elSelector, flagInitialised, function(){
        elForm = $(idFormDeliveryRegion);
        elSelector.on("change", function(event) {
            ajaxData = {};
            ajaxData[keyForm] = convertForm2JSON(elForm);
            console.log('sending data to delivery region selector controller: '); console.log(ajaxData);
            ajaxJSONData('select delivery region', mapHashToController(hashStoreSelectDeliveryRegion), ajaxData, function() { window.location.reload() }, false);
        });
        console.log("form delivery region initialised")
    });
    */
   
    let dropdownRegion = $(idRegionDelivery)[0];
    
    let option, indexHyphen, textOption;
    for (let indexOption = 0; indexOption < dropdownRegion.options.length; indexOption++) {
        option = $(dropdownRegion.options[indexOption]);
        textOption = option.text();
        indexHyphen = textOption.indexOf('-');
        option.attr(attrTextExpanded, textOption);
        option.attr(attrTextCollapsed, textOption.substring(0, indexHyphen - 1));
        option.addClass(flagCollapsed);
    }

    handleSelectCollapse(dropdownRegion);

    initialiseEventHandler(dropdownRegion, flagInitialised, function() {
        dropdownRegion = $(dropdownRegion);
        dropdownRegion.on("focus", function() {
            console.log("dropdown region focused");
            handleSelectExpand(dropdownRegion);
        });
        dropdownRegion.on("blur", function() {
            console.log("dropdown region blurred");
            handleSelectCollapse(dropdownRegion);
        });
        dropdownRegion.on("change", function() {
            handleSelectCollapse(dropdownRegion);
            let selectedRegion = dropdownRegion.val();
            console.log("selected region: ", selectedRegion);
            let basket = getLocalStorage(keyBasket);
            basket[keyIdRegionDelivery] = selectedRegion;
            // setLocalStorage(keyIdRegionDelivery, selectedRegion);
            setLocalStorage(keyBasket, basket);
            let ajaxData = {};
            ajaxData[keyIdRegionDelivery] = selectedRegion;
            ajaxJSONData('update region', mapHashToController(hashStoreSetRegion), ajaxData, null, false);
        });
    });
}

function handleSelectCollapse(elementSelect) {
    let optionSelected = $(elementSelect).find('option:selected');
    optionSelected.text(optionSelected.attr(attrTextCollapsed));
    console.log('collapsed: ', optionSelected.text());
    optionSelected.removeClass(flagExpanded);
    optionSelected.addClass(flagCollapsed);
}
function handleSelectExpand(elementSelect) {
    let optionSelected = $(elementSelect).find('option:selected');
    optionSelected.text(optionSelected.attr(attrTextExpanded));
    console.log('expanded: ', optionSelected.text());
    optionSelected.removeClass(flagCollapsed);
    optionSelected.addClass(flagExpanded);
}

function hookupCheckboxIsIncludedVAT() {
    let elForm = $(idFormIsIncludedVAT);
    let elSelector = $(elForm.find('input[type="checkbox"]')[0]);
    initialiseEventHandler(elSelector, flagInitialised, function(){
        elForm = $(idFormIsIncludedVAT);
        elSelector.on("change", function(event) {
            ajaxData = {};
            ajaxData[keyForm] = convertForm2JSON(elForm);
            console.log('sending data to include VAT controller: '); console.log(ajaxData);
            ajaxJSONData('set include VAT', mapHashToController(hashStoreSetIsIncludedVAT), ajaxData, function() { window.location.reload() }, false);
        });
        console.log("form is included VAT initialised")
    });
}

// shared hookup methods
function hookupButtonsContactUs() {
    let btnContact = $($("button.button-contact")[0]);
    initialiseEventHandler(btnContact, flagInitialised, function() {
        btnContact.on("click", function(event) {
            event.stopPropagation();
            goToPage(hashPageContact);
        });
    });
}

function hookupVideos() {
    let videos = document.querySelectorAll('video');
    videos.forEach(function(video) {
        video.addEventListener('mouseover', videoPlay(video));
        video.addEventListener('mouseout', videoPause(video));
    });
}

function videoPlay(elemVideo) {
    if (!_loading) { // elemVideo.paused && 
        elemVideo.play();
        if (_verbose) { console.log("Playing video element: " + elemVideo.name)};
    }
}

function videoPause(elemVideo) {
    elemVideo.pause();
    if (_verbose) { console.log("Pausing video element: " + elemVideo.name)};
}


// Argument validation
/*
function isNullOrWhitespace(v) {
    let txt = JSON.stringify(v).replace('/\s\g', '');
    return (txt == '' || 'null');
}
*/

function isEmpty(object) {

    let isEmpty = true;

    if (object !== null && object !== "null" && object !== undefined && object !== "undefined") {

        if (object.length == undefined) {
            isEmpty = false; // object exists but isn't a collection
        }
        else if (typeof object === "function") {
            isEmpty = false; // object is function reference
        }
        else { // string or collection

            let isString = (typeof object == "string");

            if (isString) object = object.trim();

            if (object.length > 0) {

                if (isString) {
                    isEmpty = false; // String greater than length 0
                }
                else {

                    if (typeof object[0] != "string") {
                        isEmpty = false;
                    }
                    else {
                        for(let i = 0; i < object.length; i++) {
                            if (object[i] != "") {
                                isEmpty = false;
                                break
                            }
                        }
                    }
                }
            }
        }
    }

    return isEmpty;
}

function isValidNumber(value, positiveOnly) {
    return !isEmpty(value) && !isNaN(value) && (!positiveOnly || parseFloat(value) > 0);
}

function getDataContentType(params) {

    var data = null;
    var contentType = '';

    if (!isEmpty(params)) {

        if (typeof params === "string") {
            data = params;
            contentType = "application/x-www-form-urlencoded; charset=UTF-8";
        }
        else {
            data = JSON.stringify(params);
            contentType = "application/json; charset=UTF-8";
        }
    }

    return { Data: data, ContentType: contentType };
}

function arrayContainsItem(array, itemValue) {

    var hasItem = false;

    if (!isEmpty(array) && !isEmpty(itemValue)) {

        var isJQueryElementArray = array[0] instanceof jQuery;

        if (isJQueryElementArray) {

            for (let i = 0; i < array.length; i++) {

                if ($(array[i]).is(itemValue)) {
                    hasItem = true;
                    break;
                }
            }
        }
        else {

            var isDate = array[0] instanceof Date;

            if (isDate) {
                
                for (let i = 0; i < array.length; i++) {

                    if (array[i].getTime() === itemValue.getTime()) {
                        hasItem = true;
                        break;
                    }
                }
            }
            else {

                for (let i = 0; i < array.length; i++) {

                    if (array[i] == itemValue) {
                        hasItem = true;
                        break;
                    }
                }
            }
        }
    }

    return hasItem;
}

function dictHasKey(d, k) {
    return (k in d);
}

/* System Interation
AJAX
 */
function xmlJSONData(methodName, objJSON) {
    
    var xhr = new XMLHttpRequest();

    // Specify post-request actions
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Parse the JSON response
            return JSON.parse(xhr.responseText);
        }
    };

    // Specify request path
    xhr.open('GET', '/' + methodName, true);

    // send request
    xhr.send();
}

function ajaxJSONData(dataName, url, postData, successCallback, async, headers = {}) {

    if (isEmpty(async)) async = true;
    let formattedParams = getDataContentType(postData);

    headers[keyCSRFToken] = getCSRFToken();
    console.log("headers: ", headers);
    $.ajax({
        async: async,
        type: 'POST',
        cache: false,
        url: url,
        headers: headers,
        data: formattedParams.Data,
        dataType: 'json',
        contentType: formattedParams.ContentType,
        success: function(result) {
            if (result.Success) {
                successCallback(result);
            }
            else {
                alertError("Error", result.Message);
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            var errorMessage = "There was an error while getting the " + dataName + " data";
            alertError("Error", errorMessage);
        }
    })
}

function getCSRFToken() {
    // return $('meta[name=' + nameCSRFToken + ']').attr('content');
    return $(idCSRFToken).attr('content');
}

function mapHashToController(hash) {
    if (hash == null) return mapHashToController(hashPageHome);

    url = _pathHost; // + '/';
    console.log("url: " + url + "\nhash: " + hash);
    return url + hash;

    switch (hash) {
        case hashPageErrorNoPermission:
            url += 'error';
            break;
        case hashPageStoreHome:
            url += 'store/home';
            break;
        case hashPageStoreProduct:
            url += 'store/product';
            break;
        case hashStoreBasketLoad:
            url += 'store/basket_load';
            break;
        case hashStoreBasketAdd:
            url += 'store/product';
            break;
        default:
            url += '';
    }

    return url;
}

/*
function goToPage(pageHash, parameters) {
    window.location.href = "{{ url_for(" + pageHash + (parameters == '' ? '' : ',' + parameters) + ") }}"; // getPageRoute(pageHash, parameters);
}
*/
function goToPage(pageHash, parametersJSON) {
    // window.location.href = "{{ url_for(" + pageHash + (parameters == '' ? '' : ',' + parameters) + ") }}"; // getPageRoute(pageHash, parameters);
    // ajaxJSONData(pageHash, mapHashToController(pageHash), parameters, null, false);
    url = mapHashToController(pageHash);

    
    if (!isEmpty(parametersJSON)) {
        url += '%3F'; // '?';
        let firstParameter = true;
        for (var p in parametersJSON) {
            // url += p + '=' + parametersJSON[p];
            if (!firstParameter) {
                url += '&';
            } else {
                firstParameter = false;
            }
            url += parametersJSON[p];
        }
    }
    
    leavePage();

    window.location.href = url;
    // ajaxJSONData(pageHash, url, parametersJSON, loadPageBody, false);
}
function leavePage() {}

function goToUrl(parameterisedUrl) {
    
    leavePage();

    window.location.href = parameterisedUrl;
}

function htmlEncode(value) {
    return $('<div/>').text(value).html();
}

var _domParser = null;
function htmlDecode(value) {
    if (_domParser == null) _domParser = DOMParser(); // https://www.w3docs.com/snippets/javascript/how-to-html-encode-a-string.html
    return _domParser.parseFromString(value, 'text/html').documentElement.textContent;
}

function convertForm2JSON(elemForm) {
    
    formData = {}

    formDataTmp = elemForm.serializeArray();

    $.each(formDataTmp, function(index, field) {
        formData[field.name] = field.value;
        /*
        console.log('field name: ' + field.name);
        console.log('field value: ' + field.value);
        console.log('field currentval: ' + getElementCurrentValue(field));
        */
    });
    
    return formData;
}

function loadPageBody(response) {

    let pageBody = $(idPageBody);

    console.log('ajax:');
    console.log(response.data);

    pageBody.html(response.data['html_block']);
}

/* Page elements */
function initialiseEventHandler(elSelector, initialisedClass, eventHandler) {

    // only add once
    var elObject = $(elSelector);
    if (elObject.hasClass(initialisedClass)) return;

    // add event handler
    eventHandler();

    // flag as initialised
    elObject.addClass(initialisedClass);
}

function alertError(errorType, errorText) {
    alert(errorType + '\n' + errorText);
}

function setPageToLoading(isLoading) {

    if (isLoading) {
        $(document.body).addClass(_dataLoadingFlag);
    }
    else {
        $(document.body).removeClass(_dataLoadingFlag);
    }
}


function setBackgroundToLoading(elId, isLoading) {

    if (isEmpty(el)) {

        var elObj = $(elId);

        if (isLoading) {

            setTimeout(function() {
                elObj.html("");
                elObj.css({
                    "background-image": "url(" + urlImgLoading + ")",
                    "background-position": "center",
                    "background-repeat": "no-repeat"
                });
            }, 0);
        }
        else {
            elObj.css("background-image", "");
        }
    }
}

function allowClick() {
    return !$("body").hasClass(_dataLoadingFlag);
}

function getElementCurrentValue(el) {
    let returnVal = '';
    let element = $(el);

    if (!isEmpty(el)) {

        if (element.is("input:checkbox")) {
            returnVal = (element.is(":checked"));
        }
        /*
        else if (element.hasClass(flagIsDatePicker)) {
            returnVal = getDatePickerDate(element, adjust4DayLightSavings);
        }
        */
        else if (element.is("input") || element.is("textarea") || element.is("select")) {
            returnVal = element.val();
        }
        else {
            returnVal = element.text();
        }
    }

    if (isEmpty(returnVal)) returnVal = '';

    return returnVal;
}

function parseCSSPropertyToFloat(element, propertyName) {
    var propertyText = element.css(propertyName);

    if (!isEmpty(propertyText)) {

        propertyText = propertyText.replace('px', '');

        if (!isValidNumber(propertyText, true)) return parseFloat(propertyText);
    }

    return 0.00;
}

function scrollToElement(parent, element) {
    // REQUIRED: parent has scroll-bar
    parent.scrollTop(parent.scrollTop() + (element.offset().top - parent.offset().top));
}

function isElementInContainer(container, element) {

    if (typeof jQuery === 'function') {
        if (container instanceof jQuery) container = container[0];
        if (element instanceof jQuery) element = element[0];
    }

    var containerBounds = container.getBoundingClientRect();
    var elementBounds = element.getBoundingClientRect();

    return (
        containerBounds.top <= elementBounds.top &&
        containerBounds.left <= elementBounds.left &&
        ((elementBounds.top + elementBounds.height) <= (containerBounds.top + containerBounds.height)) &&
        ((elementBounds.left + elementBounds.width) <= (containerBounds.left + containerBounds.width))
    );
}

function getRowFromElement(element) {
    return $(element).closest('tr');
}

function getCellFromElement(element) {
    return $(element).closest('td');
}



// Textareas
function removeBlankTextAreaLines(textarea) {
    textarea.val(textarea.val.replace(/(?:(?:\r\n|\r|\n)\s*){2}/gm, ''));
}

function fitTextAreasToContent(parent) {
    var textareas = parent.find('textarea');

    if (!isEmpty(textareas)) {
        for (var t = 0; t < textareas.length; t++) {
            fitTextAreaToContent($(textareas[t]));
        }
    }
}

function fitTextAreaToContent(textarea) {
    // Trim new text
    var txtNew = textarea.val().trim();
    textarea.val(txtNew);

    var elTextarea = textarea[0];

    // Clear style height and set rows = 1
    elTextarea.style.removeProperty('height');
    textarea.attr('rows', 1);

    const paddingTop = parseCSSPropertyToFloat(textarea, 'padding-top');
    const paddingBottom= parseCSSPropertyToFloat(textarea, 'padding-bottom');
    const borderTop = parseCSSPropertyToFloat(textarea, 'border-top');
    const borderBottom = parseCSSPropertyToFloat(textarea, 'border-bottom');
    let heightDelta = paddingTop + paddingBottom + borderTop + borderBottom;
    let heightNew = elTextarea.scrollHeight + heightDelta;

    // If new height is less than 1 linem default to single line height
    const heightSingleLine = parseCSSPropertyToFloat(textarea, 'line-height') + heightDelta;
    if (heightNew < heightSingleLine) heightNew = heightSingleLine;

    elTextarea.style.height = heightNew + 'px';
}



// Local storage
/*
function getPageLocalStorage(pageHash) {

    let ls;
    try {
        ls = JSON.parse(localStorage.getItem(pageHash));
    } catch {

    }

    if (isEmpty(ls)) return {}

    return ls;
}
function getPageLocalStorageCurrent() {

    return JSON.parse(localStorage.getItem(hashPageCurrent));
}

function setPageLocalStorage(pageHash, newLS) {

    localStorage.setItem(pageHash, JSON.stringify(newLS));
}

function clearPageLocalStorage(pageHash) {
    localStorage.removeItem(pageHash);
}

function setupPageLocalStorage(pageHash) {

    let ls = getPageLocalStorage(pageHash);

    if (isEmpty(ls)) ls = {};

    setPageLocalStorage(pageHash, ls);
}
*/

function getLocalStorage(key) {

    return JSON.parse(localStorage.getItem(key));
}

function setLocalStorage(key, newLS) {

    localStorage.setItem(key, JSON.stringify(newLS));
}

/*
function setupPageLocalStorageNext(pageHashNext) {
    let lsOld = getPageLocalStorage(hashPageCurrent);
    hashPageCurrent = pageHashNext;
    clearPageLocalStorage(hashPageCurrent);
    setupPageLocalStorage(hashPageCurrent);
    let lsNew = getPageLocalStorage(hashPageCurrent);
    lsNew[keyBasket] = (keyBasket in lsOld) ? lsOld[keyBasket] : {'items': []};
    setPageLocalStorage(hashPageCurrent, lsNew);
}
*/