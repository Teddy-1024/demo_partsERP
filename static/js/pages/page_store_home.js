
import { PageBase } from "./page_base.js";

export class PageStoreHome extends PageBase {
    static hash = hashPageStoreHome;

    constructor() {
        super();
    }

    initialize() {
        this.sharedInitialize();
        this.hookupFiltersStore();
        this.hookupStoreHome();
    }

    
    hookupFiltersStore() {
        hookupFilterCurrency();
        hookupFilterDeliveryRegion();
        hookupFilterIsIncludedVAT();
    }

    hookupFilterCurrency() {
        /*
        let elForm = document.querySelectorAll(idFormCurrency);
        let elSelector = document.querySelectorAll(elForm.querySelector('select')[0]);
        initialiseEventHandler(elSelector, flagInitialised, function(){
            elForm = document.querySelectorAll(idFormCurrency);
            elSelector.addEventListener("change", function(event) {
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

        let dropdownCurrency = document.querySelectorAll(idCurrency)[0];
        // dropdownCurrency.options.map(function(option) {
        let option, indexHyphen, textOption;
        for (let indexOption = 0; indexOption < dropdownCurrency.options.length; indexOption++) {
            option = document.querySelectorAll(dropdownCurrency.options[indexOption]);
            textOption = option.text();
            indexHyphen = textOption.indexOf('-');
            option.attr(attrTextExpanded, textOption);
            option.attr(attrTextCollapsed, textOption.substring(0, indexHyphen - 1));
            option.classList.add(flagCollapsed);
        }
        handleSelectCollapse(dropdownCurrency);
        initialiseEventHandler(dropdownCurrency, flagInitialised, function() {
            dropdownCurrency = document.querySelectorAll(dropdownCurrency);
            dropdownCurrency.addEventListener("focus", function() {
                handleSelectExpand(dropdownCurrency);
            });
            dropdownCurrency.addEventListener("blur", function() {
                handleSelectCollapse(dropdownCurrency);
            });
            dropdownCurrency.addEventListener("change", function() {
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

    hookupFilterDeliveryRegion() {
        /*
        let elForm = document.querySelectorAll(idFormDeliveryRegion);
        let elSelector = document.querySelectorAll(elForm.querySelector('select')[0]);
        initialiseEventHandler(elSelector, flagInitialised, function(){
            elForm = document.querySelectorAll(idFormDeliveryRegion);
            elSelector.addEventListener("change", function(event) {
                ajaxData = {};
                ajaxData[keyForm] = convertForm2JSON(elForm);
                console.log('sending data to delivery region selector controller: '); console.log(ajaxData);
                ajaxJSONData('select delivery region', mapHashToController(hashStoreSelectDeliveryRegion), ajaxData, function() { window.location.reload() }, false);
            });
            console.log("form delivery region initialised")
        });
        */
    
        let dropdownRegion = document.querySelectorAll(idRegionDelivery)[0];
        
        let option, indexHyphen, textOption;
        for (let indexOption = 0; indexOption < dropdownRegion.options.length; indexOption++) {
            option = document.querySelectorAll(dropdownRegion.options[indexOption]);
            textOption = option.text();
            indexHyphen = textOption.indexOf('-');
            option.attr(attrTextExpanded, textOption);
            option.attr(attrTextCollapsed, textOption.substring(0, indexHyphen - 1));
            option.classList.add(flagCollapsed);
        }

        handleSelectCollapse(dropdownRegion);

        initialiseEventHandler(dropdownRegion, flagInitialised, function() {
            dropdownRegion = document.querySelectorAll(dropdownRegion);
            dropdownRegion.addEventListener("focus", function() {
                console.log("dropdown region focused");
                handleSelectExpand(dropdownRegion);
            });
            dropdownRegion.addEventListener("blur", function() {
                console.log("dropdown region blurred");
                handleSelectCollapse(dropdownRegion);
            });
            dropdownRegion.addEventListener("change", function() {
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

    hookupFilterIsIncludedVAT() {
        let elForm = document.querySelectorAll(idFormIsIncludedVAT);
        let elSelector = document.querySelectorAll(elForm.querySelector('input[type="checkbox"]')[0]);
        initialiseEventHandler(elSelector, flagInitialised, function(){
            elForm = document.querySelectorAll(idFormIsIncludedVAT);
            elSelector.addEventListener("change", function(event) {
                ajaxData = {};
                ajaxData[keyForm] = convertForm2JSON(elForm);
                console.log('sending data to include VAT controller: '); console.log(ajaxData);
                ajaxJSONData('set include VAT', mapHashToController(hashStoreSetIsIncludedVAT), ajaxData, function() { window.location.reload() }, false);
            });
            console.log("form is included VAT initialised")
        });
    }

    hookupStoreCardsProduct() {
        
        let d; // , lsShared;
        let selectorCardProduct = '.card.subcard';
        initialiseEventHandler(selectorCardProduct, flagInitialised, function(cardProduct) {
            console.log("initialising product card: ", cardProduct);
            cardProduct.addEventListener("click", function(event) {
                // d = { keyIdProduct: product.attr(attrIdProduct) }
                var elemClicked = event.target;
                if (elemClicked.id != 'submit') { // disable for submit buttons
                    console.log("product click: " + cardProduct.attr(attrIdProduct));
                    console.log("permutation click: " + cardProduct.attr(attrIdPermutation));
                    var d = {}
                    d[keyIdProduct] = cardProduct.attr(attrIdProduct)
                    d[keyIdPermutation] = cardProduct.attr(attrIdPermutation)
                    // send quantity requested
                    goToPage(hashPageStoreProduct, d);
                }
            });
            console.log("click method added for product ID: " + cardProduct.attr(attrIdProduct) + ', permutation ID: ', cardProduct.attr(attrIdPermutation));
        });
    }

    leave() {
        super.leave();
    }
}
