// Shared JS file names: routing, main, shared, localStorage, appDialogs
const _dataLoadingFlag = 'data-loading'
var _verbose = true;
var hashPageCurrent;

function hookupShared() {
    hookupVideos();
    hookupNavigation();
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

function hookupNavigation() {
    console.log("hooking up navigation");

    let btnNavHome = $(idNavHome);
    initialiseEventHandler(btnNavHome, flagInitialised, function() {
        btnNavHome.on("click", function(event) {
            event.stopPropagation();
            // setupPageLocalStorageNext(hashPageStoreHome);
            goToPage(hashPageHome);
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

    hookupSelectorCurrency();
    hookupSelectorDeliveryRegion();
    hookupCheckboxIsIncludedVAT();
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
}
function hookupSelectorDeliveryRegion() {
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

function ajaxJSONData(dataName, url, postData, successCallback, async) {

    if (isEmpty(async)) async = true;
    let formattedParams = getDataContentType(postData);

    $.ajax({
        async: async,
        type: 'POST',
        cache: false,
        url: url,
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
    

    window.location.href = url;
    // ajaxJSONData(pageHash, url, parametersJSON, loadPageBody, false);
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

function displayOverlay(message, show, force) {

    if (show) {
        _overlayLoadingCount += 1;
    }
    else if (force) {
        _overlayLoadingCount = 0;
    }
    else {
        _overlayLoadingCount -= 1;
        if (_overlayLoadingCount < 0) _overlayLoadingCount = 0;
    }

    var loadingImg = $(idImageLoading);
    var overlay = $(loadingImg.closest("div.overlay"));

    if (_overlayLoadingCount == 0) {

        // Prevent short glimpse of prev. content before switch to new content
        // caused by data load but not fully rendered
        setTimeout(function() {
            overlay.fadeOut();
        }, 100);
    }
    else if (show && _overlayLoadingCount == 1) {
        // only show once
        loadingImg.html(message);
        overlay.show();
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

function imageExists(url, callback) {

    var img = new Image();

    img.onload = function() { callback(true); };
    img.onerror = function() { callback(false); };
    img.src = url;
}

function validateImageUrl(id, img) {
    imageExists(img, function(exists) {
        if (exists) {
            $("#" + id).css({ "background-image": "url(" + url + ")", "background-size": "35px 35px"})
        }
    })
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

// Date picker inputs
/*
function hookupInputDatePickers(dateInputs, notFuture, notPast, parent, addClearOption) {

    if (!isEmpty(dateInputs)) {

        let currentInput, currentDateString, currentDate, exceptionsArray;

        for (let i = 0; i < dateInputs.length; i++) {

            currentInput = $(dateInputs[i]);
            currentDateString = currentInput.val();
            currentDate = (!isEmpty(currentDateString)) ? convertDDMMYYYYString2Date(currentDateString, false) : null;
            exceptionsArray = (currentDate != null) ? [currentDate] : null;

            turnInputIntoDatePicker(currentInput, notFuture, notPast, exceptionsArray);
        }

        if (!isEmpty(parent)) {
            // stop user from manually typing date except backspace and delete
            // which will clear the whole value to ensure we either have a whole
            // date string or none

            parent.on("keydown", isDatePickerSelector, function(event) {
                if (event.keyCode == 46 | event.keyCode == 8) { // delete or backspace
                    $(this).val('');
                }
                else {
                    event.preventDefault();
                    event.stopPropagation();
                }

                return false
            });
            
            if (addClearOption) {

                // if user right-clicks in date input, give option to clear the date
                parent.contextMenu({
                    selector: isDatePickerSelector,
                    delay: 100,
                    autoHide: true,
                    position: function(opt, x, y) { 
                        var event = opt.$trigger[0]?.ownerDocument?.defaultView?.event || event;
                        opt.$menu.position({ my: 'center top', at: 'center top', of: event }); 
                    },
                    items: {
                        "clears": {
                            name: "Clear Date",
                            icon: "delete",
                            disabled: function(key, opt) { return isEmpty($(opt.$trigger)); }, // if it's already empty, don't do anything
                            callback: function(itemKey, opt, rootMenu, originalEvent) { var input = $(opt.$trigger); input.val(''); input.trigger('change'); }
                        }
                    }
                });
            }
        }
    }
}

function turnInputIntoDatePicker(input, notFuture, notPast, exceptionValueArray) {
    
    var beforeShowDayCallBack = null;

    if (notFuture || notPast) {

        var today = new Date();
        today.setHours(0, 0, 0, 0);

        var tomorrow = new Date();
        tomorrow.setDate(today.getDate() + 1);
        tomorrow.setHours(0, 0, 0, 0);

        var hasExceptions = !isEmpty(exceptionValueArray);

        beforeShowDayCallBack = function(date) {

            var selectedDate = date.getTime();
            var fieldHasException = hasExceptions && arrayContainsItem(exceptionValueArray, date);

            if (notFuture && (tomorrow < selectedDate) && fieldHasException) return [false, 'redday', 'You cannot choose a future date'];
            if (notPast && (selectedDate < today) && fieldHasException) return [false, 'redday', 'You cannot choose a past date'];

            return [true, '', ''];
        };
    }

    input.datepicker({
        dateFormat: 'dd-mm-yy',
        navigationAsDateFormat: true,
        beforeShowDay: beforeShowDayCallBack
    });

    // prevent datepicker from appearing on right click
    input.on('contextmenu', function() { $(this).datepicker('hide'); });

    // Disable autocomplete suggestions appearing when clicking on input
    input.attr('autocomplete', 'off');
}

function setDatePickerDate(input, objDate) {
    if (!isEmpty(objDate)) {
        input.val('');
    }
    else {
        input.datepicker('setDate', objDate);
    }
}

function getDatePickerDate(input, adjust4DayLightSavings) {

    var date = null;

    if (!isEmpty(input)) {
        date = input.datepicker('getDate');

        if (adjust4DayLightSavings) {
            formatDateDayLightSavingsTime(date);
        }
    }

    return date;
}

function formatDateDayLightSavingsTime(date) {
    // JSON.stringify removes hour delta for daylight savings 
    // e.g. 13/11/2023 01:00:00 goes to 13/11/2023 00:00:00
    // this adds an hour so it becomes the correct time when stringified
    if (!isEmpty(date)) {
        date.setTime(date.getTime() - date.getTimezoneOffset() * 60 * 1000)
    }
}
*/
function convertJSONDateString2Date(dateStr) {
    if (isEmpty(dateStr)) return null;
    if (dateStr instanceof Date) return dateStr;
    return new Date(parseInt(dateStr.substr(6)));
}

function convertDDMMYYYYString2Date(dateStr, adjust4DayLightSavings) {
    var date = null;

    if (!isEmpty(dateStr)) {
        if (dateStr instanceof Date) {
            date = dateStr;
        }
        else {
            var dateParts = dateStr.split('-');

            if (dateParts.length == 3) {
                date = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
            }
        }

        if (adjust4DayLightSavings && !isEmpty(date)) {
            formatDateDayLightSavingsTime(date);
        }
    }

    return date;
}

function convertDate2DDMMYYYYString(date) {
    if (isEmpty(date)) return '';

    try {
        var dd = date.getDate();
        var mm = date.getMonth() + 1;
        var yyyy = date.getFullYear();

        if (dd < 10) dd = '0' + dd;
        if (dd < 10) mm = '0' + mm;
        
        return dd + '-' + mm + '-' + yyyy;
    }
    catch (err) {
        return 'Formatting error';
    }
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


// Data tables
function getDataTableCellByNode(table, elRow, indexColumn) {
    // normal jQuery selector won't pick up hidden columns
    return $(table.DataTable().cells(elRow, indexColumn, null).nodes());
}

function outputTableElementDateInput(table, elRow, indexColumn, value) {

    let currentCell = getDataTableCellByNode(table, elRow, indexColumn);

    let dateTxt = '';

    if (!isEmpty(value)) {
        if (typeof value === 'string') value = convertJSONDateString2Date(value);
    }
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