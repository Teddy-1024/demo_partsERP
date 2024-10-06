
import Events from "../../lib/events.js";
import LocalStorage from "../../lib/local_storage.js";
import Validation from "../../lib/validation.js";
// import BasePage from "../base.js";
import DOM from "../../dom.js";
import { isEmpty } from "../../lib/utils.js";

export default class StoreMixinPage {
    constructor(pageCurrent) {
        this.page = pageCurrent;
    }

    initialize() {
        console.log('hookup store start for ', this.page.hash);
        this.hookupFilters();
        this.hookupLocalStorageStore();
        this.hookupBasket();
        this.hookupButtonsAddToBasket();
    }
    hookupFilters() {
        this.hookupFilterCurrency();
        this.hookupFilterDeliveryRegion();
        this.hookupFilterIsIncludedVAT();
    }
    hookupFilterCurrency() {
        /*
        let elForm = document.querySelectorAll(idFormCurrency);
        let elSelector = document.querySelectorAll(elForm.querySelector('select')[0]);
        Events.initialiseEventHandler(elSelector, flagInitialised, function(){
            elForm = document.querySelectorAll(idFormCurrency);
            elSelector.addEventListener("change", function(event) {
                ajaxData = {};
                ajaxData[keyForm] = convertForm2JSON(elForm);
                console.log('sending data to currency selector controller: '); console.log(ajaxData);
                ajaxJSONData('select currency', mapHashToController(hashStoreSelectCurrency), ajaxData, function() { window.location.reload() }, false);

                let optionSelected = elSelector.options[elSelector.selectedIndex]
                let textSelected = optionSelected.getAttribute(attrDataShort)
                
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
            option.setAttribute(attrTextExpanded, textOption);
            option.setAttribute(attrTextCollapsed, textOption.substring(0, indexHyphen - 1));
            option.classList.add(flagCollapsed);
        }
        handleSelectCollapse(dropdownCurrency);
        Events.initialiseEventHandler(dropdownCurrency, flagInitialised, function() {
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
                let basket = LocalStorage.getLocalStorage(keyBasket);
                basket[keyIdCurrency] = selectedCurrency;
                // LocalStorage.setLocalStorage(keyIdCurrency, selectedCurrency);
                LocalStorage.setLocalStorage(keyBasket, basket);
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
        Events.initialiseEventHandler(elSelector, flagInitialised, function(){
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
            option.setAttribute(attrTextExpanded, textOption);
            option.setAttribute(attrTextCollapsed, textOption.substring(0, indexHyphen - 1));
            option.classList.add(flagCollapsed);
        }

        handleSelectCollapse(dropdownRegion);

        Events.initialiseEventHandler(dropdownRegion, flagInitialised, function() {
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
                let basket = LocalStorage.getLocalStorage(keyBasket);
                basket[keyIdRegionDelivery] = selectedRegion;
                // LocalStorage.setLocalStorage(keyIdRegionDelivery, selectedRegion);
                LocalStorage.setLocalStorage(keyBasket, basket);
                let ajaxData = {};
                ajaxData[keyIdRegionDelivery] = selectedRegion;
                ajaxJSONData('update region', mapHashToController(hashStoreSetRegion), ajaxData, null, false);
            });
        });
    }
    hookupFilterIsIncludedVAT() {
        let elForm = document.querySelectorAll(idFormIsIncludedVAT);
        let elSelector = document.querySelectorAll(elForm.querySelector('input[type="checkbox"]')[0]);
        Events.initialiseEventHandler(elSelector, flagInitialised, function(){
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
    hookupLocalStorage() {

        // setupPageLocalStorage(hashPageCurrent);
        // let lsPage = getPageLocalStorage(hashPageCurrent);
        // let d = {}
        // d[keyBasket] = LocalStorage.getLocalStorage(keyBasket); // (keyBasket in lsPage) ? lsPage[keyBasket] : {'items': []};
        // console.log('d:'); console.log(d);
        let basketLocalStorage = LocalStorage.getLocalStorage(keyBasket);
        if (!StoreMixinPage.validateBasket(basketLocalStorage)) {
            console.log('locally-stored basket not valid');
            basketLocalStorage = StoreMixinPage.makeNewBasket();
        }
        let basketServer = StoreMixinPage.validateBasket(userBasket) ? userBasket : basketLocalStorage;
        let basket = StoreMixinPage.areEqualBaskets(basketLocalStorage, basketServer) ? basketServer : StoreMixinPage.mergeBaskets(basketLocalStorage, basketServer);
        if (!StoreMixinPage.areEqualBaskets(basketLocalStorage, basket)) {
            LocalStorage.setLocalStorage(keyBasket, basket);
        }
        if (!StoreMixinPage.areEqualBaskets(basketServer, basket)) {
            /*
            let ajaxData = {}
            ajaxData[keyBasket] = basket;
            // console.log("hookupLocalStorageStore\nhashStoreBasketLoad: " + hashStoreBasketLoad + "\n");
            // ajaxData[keyIsIncludedVAT] = LocalStorage.getLocalStorage(keyIsIncludedVAT);
            console.log('ajax:' + ajaxData);
            ajaxJSONData(keyBasket, mapHashToController(hashStoreBasketLoad), ajaxData, loadBasket, false);
            */
            API.saveStoreBasket(basket);
        }
        userBasket = basket;
    }
    static validateBasket(basket) {
        return (
            Validation.isEmpty(basket) &&
            Validation.dictHasKey(basket, keyItems) &&
            Validation.dictHasKey(basket, keyIsIncludedVAT) &&
            Validation.dictHasKey(basket, keyIdCurrency) &&
            Validation.dictHasKey(basket, keyIdRegionDelivery)                    
        );
    }
    static makeNewBasket() {
        return {
            [keyItems]: [],
            [keyIsIncludedVAT]: true,
            [keyIdCurrency]: 1,
            [keyIdRegionDelivery]: 1
        };
    }
    static areEqualBaskets(basket1, basket2) {
        return JSON.stringify(basket1) === JSON.stringify(basket2);
    }
    static mergeBaskets(basketPrimary, basketSecondary) {
        let basket = {...basketSecondary, ...basketPrimary};
        let items = {};
        for (let item of basketSecondary[keyItems]) {
            items[item[keyIdPermutation]] = item.Quantity;
        }
        for (let item of basketPrimary[keyItems]) {
            items[item[keyIdPermutation]] = items[item[keyIdPermutation]] ? items[item[keyIdPermutation]] + item.Quantity : item.Quantity;
        }
        basket[keyItems] = Object.values(items);
        return basket;
    }
    hookupBasket() {
        // const containerBasket = document.querySelectorAll(idContainerBasket);
        this.toggleShowButtonCheckout(); // containerBasket
        this.hookupButtonCheckout();
        this.hookupBasketItemPlusAndMinusButtons();
        this.hookupBasketAddInputs();
        this.hookupBasketEditInputs();
        this.hookupDeleteBasketItemButtons();
    }
    toggleShowButtonCheckout() {
        console.log("toggling checkout button");
        const buttonCheckout = document.querySelectorAll(idButtonCheckout);
        const labelBasketEmpty = document.querySelectorAll(idLabelBasketEmpty);
        if (userBasket['items'].length == 0) {
            buttonCheckout.style.display = "none";
            labelBasketEmpty.style.display = "";
        } else {
            buttonCheckout.style.display = "";
            labelBasketEmpty.style.display = "none";
        }
    }
    hookupButtonCheckout() {
        console.log("hooking up checkout button");
        const buttonCheckout = document.querySelectorAll(idButtonCheckout);
        // let lsPage = getPageLocalStorage(hashPageCurrent);
        Events.initialiseEventHandler(buttonCheckout, flagInitialised, function() {
            buttonCheckout.addEventListener("click", function() {
                /*
                //setupPageLocalStorageNext(hashPageStoreBasket);
                let basket = LocalStorage.getLocalStorage(keyBasket);
                // goToPage(hashPageStoreBasket);
                let ajaxData = {};
                ajaxData[keyBasket] = basket;

                ajaxJSONData('checkout', mapHashToController(hashPageStoreBasket), ajaxData, null, false);
                */
                this.router.navigateToHash(hashPageStoreBasket);
            });
        });
    }
    hookupBasketItemPlusAndMinusButtons() {
        const minVal = 1;
        const basket = document.querySelector(idFormBasket);
        // Basket Add
        // Increment
        basket.querySelectorAll('div.btn-increment[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function() {
            let elButton = this;
            Events.initialiseEventHandler(elButton, flagInitialised, function(){
                elButton.addEventListener("click", function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                    let elInput = document.querySelectorAll(getFormProductSelector(typeFormBasketAdd, elButton)).querySelector('input[type="number"]');
                    // console.log('input selector ='); console.log('form[' + attrFormType + '=' + elButton.getAttribute(attrFormType) + '][' + attrIdProduct + '=' + elButton.getAttribute(attrIdProduct) + ']');
                    let newVal = parseInt(DOM.getElementValueCurrent(elInput));
                    if (isNaN(newVal)) newVal = minVal;
                    newVal += 1;
                    elInput.val(newVal);
                });
            });
        });
        // Decrement
        basket.querySelectorAll('div.btn-decrement[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function() {
            let elButton = this;
            Events.initialiseEventHandler(elButton, flagInitialised, function(){
                elButton.addEventListener("click", function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                    // let product = document.querySelectorAll('.card.subcard[' + attrIdProduct +'=' + elButton.getAttribute(attrIdProduct) + ']');
                    let elInput= document.querySelectorAll(getFormProductSelector(typeFormBasketAdd, elButton)).querySelector('input[type="number"]');
                    let newVal = parseInt(DOM.getElementValueCurrent(elInput));
                    if (isNaN(newVal)) newVal = minVal;
                    newVal = Math.max(minVal, newVal - 1);
                    elInput.val(newVal);
                });
            });
        });

        // Basket Edit
        // Increment
        basket.querySelectorAll('div.btn-increment[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function() {
            let elButton = this;
            Events.initialiseEventHandler(elButton, flagInitialised, function(){
                elButton.addEventListener("click", function(event) {
                    event.stopPropagation();
                    // basketItem = document.querySelectorAll('.card.subcard[' + attrIdProduct +'=' + elButton.getAttribute(attrIdProduct) + ']');
                    let elInput = document.querySelectorAll(getFormProductSelector(typeFormBasketEdit, elButton)).querySelector('input[type="number"]');
                    // console.log('input selector ='); console.log('form[' + attrFormType + '=' + elButton.getAttribute(attrFormType) + '][' + attrIdProduct + '=' + elButton.getAttribute(attrIdProduct) + ']');
                    let newVal = parseInt(DOM.getElementValueCurrent(elInput));
                    if (isNaN(newVal)) newVal = minVal;
                    newVal += 1;
                    elInput.val(newVal);
                    elInput.trigger("change");
                });
            });
        });
        // Decrement
        basket.querySelectorAll('div.btn-decrement[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function() {
            let elButton = this;
            Events.initialiseEventHandler(elButton, flagInitialised, function(){
                elButton.addEventListener("click", function(event) {
                    event.stopPropagation();
                    let elInput= document.querySelectorAll(getFormProductSelector(typeFormBasketEdit, elButton)).querySelector('input[type="number"]');
                    let newVal = parseInt(DOM.getElementValueCurrent(elInput));
                    if (isNaN(newVal)) newVal = minVal;
                    newVal = Math.max(minVal, newVal - 1);
                    elInput.val(newVal);
                    elInput.trigger("change");
                });
            });
        });
    }
    hookupBasketAddForms() {
        let basketAddFormSelector = 'form[' + attrFormType + '=' + typeFormBasketAdd + ']';
        Events.initialiseEventHandler(basketAddFormSelector, flagInitialised, (basketAddForm) => {
            let quantityInput = basketAddForm.querySelector('input[type="number"]');
            quantityInput.addEventListener("change", function(event) {
                let newVal = parseInt(quantityInput.value);
                if (isNaN(newVal) || newVal < 0) {
                    quantityInput.value = 0;
                }
            });
            let buttonSubmit = basketAddForm.querySelector('button'); // [type="submit"]
            buttonSubmit.addEventListener("click", (event) => {
                event.preventDefault();
                event.stopPropagation();
                let newBasketItem = {};
                newBasketItem[keyIdProductPermutation] = basketAddForm.getAttribute(attrIdPermutation);
                newBasketItem[keyQuantity] = quantityInput.value;
                API.storeAddToBasket(newBasketItem);
            });
        });
    }
    hookupBasketEditForms() {
        let basketEditFormSelector = 'form[' + attrFormType + '=' + typeFormBasketEdit + ']';
        Events.initialiseEventHandler(basketEditFormSelector, flagInitialised, (basketEditForm) => {
            let quantityInput = basketEditForm.querySelector('input[type="number"]');
            quantityInput.addEventListener("change", function(event) {
                let newVal = parseInt(quantityInput.value);
                if (isNaN(newVal) || newVal < 0) {
                    quantityInput.value = 0;
                }
                if (quantityInput.value != basketEditForm.getAttribute(attrQuantity)) {
                    let newBasketItem = {};
                    newBasketItem[keyIdProductPermutation] = basketEditForm.getAttribute(attrIdPermutation);
                    newBasketItem[keyQuantity] = quantityInput.value;
                    API.storeSaveBasket(newBasketItem);
                }
            });
            let deleteButton = basketEditForm.querySelector('button'); // [type="button"]
            deleteButton.addEventListener("click", (event) => {
                event.preventDefault();
                event.stopPropagation();
                API.storeDeleteBasketItem(basketEditForm.getAttribute(attrIdPermutation));
            });
        });
    }

    loadBasket(response) {
        userBasket = response.data[keyBasket];
        let basketForm = document.querySelectorAll(idFormBasket);
        /*
        basketForm.replaceChildren();
        let items = userBasket[keyItems];
        let basketItem;
        items.forEach(item => {
            basketItem = document.createElement('div');
            basketForm.appendChild(basketItem);
        });
        */
        let htmlBlock = response.data[keyHtmlBlock];
        basketForm.innerHTML = htmlBlock;
        this.hookupBasket();
    }
    
    getCurrencySelected() {
        let elementSelectorCurrency = document.querySelectorAll(idSelectorCurrency);
        let selectedCurrency = elementSelectorCurrency.val();
        console.log("selected currency: ", selectedCurrency);
        return selectedCurrency;
    }

    hookupStoreCardsProduct() {
        
        let d; // , lsShared;
        let selectorCardProduct = '.card.subcard';
        Events.initialiseEventHandler(selectorCardProduct, flagInitialised, function(cardProduct) {
            console.log("initialising product card: ", cardProduct);
            cardProduct.addEventListener("click", function(event) {
                // d = { keyIdProduct: product.getAttribute(attrIdProduct) }
                var elemClicked = event.target;
                if (elemClicked.id != 'submit') { // disable for submit buttons
                    console.log("product click: " + cardProduct.getAttribute(attrIdProduct));
                    console.log("permutation click: " + cardProduct.getAttribute(attrIdPermutation));
                    var d = {}
                    d[keyIdProduct] = cardProduct.getAttribute(attrIdProduct)
                    d[keyIdPermutation] = cardProduct.getAttribute(attrIdPermutation)
                    // send quantity requested
                    goToPage(hashPageStoreProduct, d);
                }
            });
            console.log("click method added for product ID: " + cardProduct.getAttribute(attrIdProduct) + ', permutation ID: ', cardProduct.getAttribute(attrIdPermutation));
        });
    }

    leave() {}

    /*
    getFormProductSelector(typeForm, elementInForm) {
        idPermutation = elementInForm.getAttribute(attrIdPermutation);
        console.log('idPermutation: ', idPermutation);
        hasPermutation = !Validation.isEmpty(idPermutation);
        console.log('has permutation: ', hasPermutation);
        selectorIdPermutation = hasPermutation ? '[' + attrIdPermutation + '=' + idPermutation + ']' : '';
        return 'form[' + attrFormType + '="' + typeForm + '"][' + attrIdProduct + '=' + elementInForm.getAttribute(attrIdProduct) + ']' + selectorIdPermutation;
    }
        
    addMetadataBasketToJSON(jsonData) {
        jsonData[keyIdCurrency] = LocalStorage.getLocalStorage(keyIdCurrency);
        jsonData[keyIdRegionDelivery] = LocalStorage.getLocalStorage(keyIdRegionDelivery);
        jsonData[keyIsIncludedVAT] = LocalStorage.getLocalStorage(keyIsIncludedVAT);
        return jsonData;
    }
    */

    /*
    loadFiltersFromLocalStorage(pageHash, parameters_dict) {
        
        let lsOld = getPageLocalStorage(pageHashCurrent);
        pageHashCurrent = pageHash;
        clearPageLocalStorage(pageHashCurrent);
        setupPageLocalStorage(pageHashCurrent);
        let lsNew = getPageLocalStorage(pageHashCurrent);
        lsNew[keyBasket] = (keyBasket in lsOld) ? lsOld[keyBasket] : {'items': []};
        setPageLocalStorage(pageHashCurrent, lsNew);
        
        goToPage(pageHash, parameters_dict);
    }
    */
}
