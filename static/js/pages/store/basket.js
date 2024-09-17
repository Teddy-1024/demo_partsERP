
import Events from "../../lib/events.js";
import LocalStorage from "../../lib/local_storage.js";
import BasePage from "../base.js";

export default class PageStoreBasket extends BasePage {
    static hash = hashPageStoreBasket;

    constructor(router) {
        super(router);
    }

    initialize() {
        this.sharedInitialize();
        this.hookupStoreCardsInfo();
        this.hookupOverlaysStoreBasketInfo();
        this.hookupButtonCheckoutSession();
    }

    
    hookupStoreCardsInfo() {
        
        document.querySelectorAll(idContainerInfoDelivery).addEventListener("click", function(event) {
            console.log("delivery modal display method");
            document.querySelectorAll(idOverlayInfoDelivery).css('display', 'block');
        });
        
        document.querySelectorAll(idContainerInfoBilling).addEventListener("click", function(event) {
            console.log("billing modal display method");
            document.querySelectorAll(idOverlayInfoBilling).css('display', 'block');
        });
    }

    hookupOverlaysStoreBasketInfo() {

        let elOverlay, elForm;

        // Delivery
        elOverlay = document.querySelectorAll(idOverlayInfoDelivery);
        elForm = elOverlay.querySelector('form');
        
        hookupOverlay(elOverlay);
        Events.initialiseEventHandler(elForm, flagInitialised, function() {
            elForm.submit(function(event) {
                elForm = document.querySelectorAll(elForm);
                event.preventDefault();
                console.log("delivery submit method");
                
                ajaxData = {};
                ajaxData[keyInfoType] = keyInfoDelivery;
                ajaxData = convertFormBilling2JSON(ajaxData, idOverlayInfoDelivery); 

                ajaxJSONData('info delivery', mapHashToController(hashStoreBasketInfo), ajaxData, loadInfoAddress, false);
                // document.querySelectorAll(idOverlayInfoDelivery).css('display', 'none');
            });
        });

        // Billing
        elOverlay = document.querySelectorAll(idOverlayInfoBilling);
        elForm = elOverlay.querySelector('form');

        hookupOverlay(elOverlay);
        Events.initialiseEventHandler(elForm, flagInitialised, function() {
            elForm.submit(function(event) {
                event.preventDefault();
                console.log("billing submit method");
                
                ajaxData = {};
                ajaxData[keyInfoType] = keyInfoBilling;
                ajaxData = convertFormBilling2JSON(ajaxData, idOverlayInfoBilling); // formData; // form.serialize();

                ajaxJSONData('info billing', mapHashToController(hashStoreBasketInfo), ajaxData, loadInfoAddress, false);
                // document.querySelectorAll(idOverlayInfoBilling).css('display', 'none');
            });
        });
        let keys = [keyNameFull, keyPhoneNumber, keyPostcode, keyAddress1, keyCity, keyCounty];
        for (var k in keys) {
            elForm.querySelector('#' + keys[k]).removeAttr('required');
        }
    }

    loadInfoAddress(response) {
        
        console.log('ajax:'); console.log(response.data);
        let infoType = response.data[keyInfoType];
        let infoAddress = response.data[infoType];
        LocalStorage.setLocalStorage(infoType, infoAddress);

        // update webpage elements in background
        if (infoType == keyInfoBilling) {

            let container = document.querySelectorAll(idContainerInfoBilling);
            if (infoAddress[keyInfoIdentical]) {
                container.querySelector('div').innerHTML = "Same as delivery address";
            } else {
                container.querySelector('div').innerHTML = "<strong>" + infoAddress[keyNameFull] + '</strong> at <strong>' + infoAddress[keyPostcode] + "</strong>";
            }

            document.querySelectorAll(idOverlayInfoBilling).css('display', 'none');

            document.querySelectorAll(idOverlayInfoBilling).querySelector('form').classList.add(flagSubmitted);
        } else {

            let container = document.querySelectorAll(idContainerInfoDelivery);
            container.querySelector('div').innerHTML = "<strong>" + infoAddress[keyNameFull] + '</strong> at <strong>' + infoAddress[keyPostcode] + "</strong>";

            document.querySelectorAll(idOverlayInfoDelivery).css('display', 'none');

            document.querySelectorAll(idOverlayInfoDelivery).querySelector('form').classList.add(flagSubmitted);
        }
    }

    convertFormBilling2JSON(ajaxData, idOverlayInfo) {
        
        let elOverlay, elForm, elOverlayDelivery, elFormDelivery;
        
        elOverlay = document.querySelectorAll(idOverlayInfo);
        elForm = elOverlay.querySelector('form');
        elOverlay = document.querySelectorAll(idOverlayInfoDelivery);
        elForm = elOverlay.querySelector('form');
        
        console.log('converting billing form to json\nform ID: ' + elForm.id);
        ajaxData[keyForm] = convertForm2JSON(elForm); // formData; // form.serialize();
        let keys = [keyNameFull, keyPhoneNumber, keyPostcode, keyAddress1, keyAddress2, keyCity, keyCounty];
        console.log('ajaxData:');
        console.log(ajaxData);
        ajaxData[keyForm][keyInfoIdentical] = getElementCurrentValue(elForm.querySelector('#' + keyInfoIdentical));
        for (var k in keys) {
            if (idOverlayInfo == idOverlayInfoBilling && ajaxData[keyForm][keyInfoIdentical]) {
                ajaxData[keyForm][keys[k]] = getElementCurrentValue(elFormDelivery.querySelector('#' + keys[k]));
            } else {
                ajaxData[keyForm][keys[k]] = getElementCurrentValue(elForm.querySelector('#' + keys[k]));
            }
        }
        console.log('ajaxData:');
        console.log(ajaxData);
        return ajaxData;
    }

    hookupButtonCheckoutSession() {
        let btnCheckout = document.querySelectorAll(idButtonCheckout);
        btnCheckout.classList.remove(flagInitialised);
        Events.initialiseEventHandler(idButtonCheckout, flagInitialised, function() {

            btnCheckout.removeEventListener("click");
            btnCheckout.addEventListener("click", function(event) {
                
                
                //setupPageLocalStorageNext(hashPageStoreBasket);
                let basket = LocalStorage.getLocalStorage(keyBasket);
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

    handleResponseCheckout(response) {
        // let tmpData = {};
        // tmpData[keyIdCheckout] = response.data[keyIdCheckout]
        // goToPage(hashPageStoreCheckoutSession, tmpData);
        window.location.href = response.data[keyUrlCheckout]
    }

    hookupButtonFormBillingCopy() {

        // let elButton = document.querySelectorAll(idButtonFormBillingCopy);

        Events.initialiseEventHandler(idButtonFormBillingCopy, flagInitialised, function() {
            document.querySelectorAll(idButtonFormBillingCopy).addEventListener("click", function (event) {
                
                let keys = [keyNameFull, keyPhoneNumber, keyPostcode, keyAddress1, keyAddress2, keyCity, keyCounty];

                let elFormBilling = document.querySelectorAll(idOverlayInfoBilling).querySelector('form');
                let elFormDelivery = document.querySelectorAll(idOverlayInfoDelivery).querySelector('form');

                for (var k in keys) {
                    elFormBilling.querySelector('#' + keys[k]).value = getElementCurrentValue(elFormDelivery.querySelector('#' + keys[k]));
                }
            });
        });
    }


    leave() {
        super.leave();
    }
}
