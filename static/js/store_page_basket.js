var _loading = true; 

function hookupStorePageBasket() {
    _loading = false;

    hookupStoreCardsInfo();
    hookupOverlaysStoreBasketInfo();
    hookupBtnCheckoutSession();
}

function hookupStoreCardsInfo() {
    
    $(idContainerInfoDelivery).on("click", function(event) {
        console.log("delivery modal display method");
        $(idOverlayInfoDelivery).css('display', 'block');
    });
    
    $(idContainerInfoBilling).on("click", function(event) {
        console.log("billing modal display method");
        $(idOverlayInfoBilling).css('display', 'block');
    });
}

function hookupOverlaysStoreBasketInfo() {

    let elOverlay, elForm;

    // Delivery
    elOverlay = $(idOverlayInfoDelivery);
    elForm = elOverlay.find('form');
    
    hookupOverlay(elOverlay);
    initialiseEventHandler(elForm, flagInitialised, function() {
        elForm.submit(function(event) {
            elForm = $(elForm);
            event.preventDefault();
            console.log("delivery submit method");
            
            ajaxData = {};
            ajaxData[keyInfoType] = keyInfoDelivery;
            ajaxData = convertFormBilling2JSON(ajaxData, idOverlayInfoDelivery); 

            ajaxJSONData('info delivery', mapHashToController(hashStoreBasketInfo), ajaxData, loadInfoAddress, false);
            // $(idOverlayInfoDelivery).css('display', 'none');
        });
    });

    // Billing
    elOverlay = $(idOverlayInfoBilling);
    elForm = elOverlay.find('form');

    hookupOverlay(elOverlay);
    initialiseEventHandler(elForm, flagInitialised, function() {
        elForm.submit(function(event) {
            event.preventDefault();
            console.log("billing submit method");
            
            ajaxData = {};
            ajaxData[keyInfoType] = keyInfoBilling;
            ajaxData = convertFormBilling2JSON(ajaxData, idOverlayInfoBilling); // formData; // form.serialize();

            ajaxJSONData('info billing', mapHashToController(hashStoreBasketInfo), ajaxData, loadInfoAddress, false);
            // $(idOverlayInfoBilling).css('display', 'none');
        });
    });
    let keys = [keyNameFull, keyPhoneNumber, keyPostcode, keyAddress1, keyCity, keyCounty];
    for (var k in keys) {
        elForm.find('#' + keys[k]).removeAttr('required');
    }
}

function loadInfoAddress(response) {
    
    console.log('ajax:'); console.log(response.data);
    let infoType = response.data[keyInfoType];
    let infoAddress = response.data[infoType];
    setLocalStorage(infoType, infoAddress);

    // update webpage elements in background
    if (infoType == keyInfoBilling) {

        let container = $(idContainerInfoBilling);
        if (infoAddress[keyInfoIdentical]) {
            container.find('div').html("Same as delivery address");
        } else {
            container.find('div').html("<strong>" + infoAddress[keyNameFull] + '</strong> at <strong>' + infoAddress[keyPostcode] + "</strong>");
        }

        $(idOverlayInfoBilling).css('display', 'none');

        $(idOverlayInfoBilling).find('form').addClass(flagSubmitted);
    } else {

        let container = $(idContainerInfoDelivery);
        container.find('div').html("<strong>" + infoAddress[keyNameFull] + '</strong> at <strong>' + infoAddress[keyPostcode] + "</strong>");

        $(idOverlayInfoDelivery).css('display', 'none');

        $(idOverlayInfoDelivery).find('form').addClass(flagSubmitted);
    }
}

function convertFormBilling2JSON(ajaxData, idOverlayInfo) {
    
    let elOverlay, elForm, elOverlayDelivery, elFormDelivery;
    
    elOverlay = $(idOverlayInfo);
    elForm = elOverlay.find('form');
    elOverlay = $(idOverlayInfoDelivery);
    elForm = elOverlay.find('form');
    
    console.log('converting billing form to json\nform ID: ' + elForm.id);
    ajaxData[keyForm] = convertForm2JSON(elForm); // formData; // form.serialize();
    let keys = [keyNameFull, keyPhoneNumber, keyPostcode, keyAddress1, keyAddress2, keyCity, keyCounty];
    console.log('ajaxData:');
    console.log(ajaxData);
    ajaxData[keyForm][keyInfoIdentical] = getElementCurrentValue(elForm.find('#' + keyInfoIdentical));
    for (var k in keys) {
        if (idOverlayInfo == idOverlayInfoBilling && ajaxData[keyForm][keyInfoIdentical]) {
            ajaxData[keyForm][keys[k]] = getElementCurrentValue(elFormDelivery.find('#' + keys[k]));
        } else {
            ajaxData[keyForm][keys[k]] = getElementCurrentValue(elForm.find('#' + keys[k]));
        }
    }
    console.log('ajaxData:');
    console.log(ajaxData);
    return ajaxData;
}

function hookupBtnCheckoutSession() {
    let btnCheckout = $(idBtnCheckout);
    btnCheckout.removeClass(flagInitialised);
    initialiseEventHandler(idBtnCheckout, flagInitialised, function() {

        btnCheckout.off("click");
        btnCheckout.on("click", function(event) {
            
            
            //setupPageLocalStorageNext(hashPageStoreBasket);
            let basket = getLocalStorage(keyBasket);
            // goToPage(hashPageStoreBasket);
            let ajaxData = {};
            ajaxData[keyBasket] = basket;
            ajaxData = convertFormBilling2JSON(ajaxData, idOverlayInfoDelivery);
            ajaxData = convertFormBilling2JSON(ajaxData, idOverlayInfoBilling);
            ajaxData[key_code_currency] = getCurrencySelected();
            // ajaxData[keyIsSubscription] = false; // only checkout one-time payment items for now

            ajaxJSONData('checkout session', mapHashToController(hashPageStoreCheckout), ajaxData, handleResponseCheckout, false);
        });
    });
}

function handleResponseCheckout(response) {
    // let tmpData = {};
    // tmpData[keyIdCheckout] = response.data[keyIdCheckout]
    // goToPage(hashPageStoreCheckoutSession, tmpData);
    window.location.href = response.data[keyUrlCheckout]
}

function hookupBtnFormBillingCopy() {

    // let elBtn = $(idBtnFormBillingCopy);

    initialiseEventHandler(idBtnFormBillingCopy, flagInitialised, function() {
        $(idBtnFormBillingCopy).on("click", function (event) {
            
            let keys = [keyNameFull, keyPhoneNumber, keyPostcode, keyAddress1, keyAddress2, keyCity, keyCounty];

            let elFormBilling = $(idOverlayInfoBilling).find('form');
            let elFormDelivery = $(idOverlayInfoDelivery).find('form');

            for (var k in keys) {
                elFormBilling.find('#' + keys[k]).val(getElementCurrentValue(elFormDelivery.find('#' + keys[k])));
            }
        });
    });
}
