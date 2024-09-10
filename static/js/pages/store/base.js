
// import { BasePage } from "../base.js";
import { DOM } from "../../dom.js";
import { isEmpty } from "../../lib/utils.js";

export class StoreMixinPage { // extends BasePage {
    constructor() {
        super();
    }

    initialize(thisPage) {
        console.log('hookup store start for ', DOM.getHashPageCurrent());
        this.hookupFiltersStore();
        this.hookupLocalStorageStore();
        this.hookupBasket();
        this.hookupButtonsAdd2Basket();
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
    hookupLocalStorageStore() {

        // setupPageLocalStorage(hashPageCurrent);
        // let lsPage = getPageLocalStorage(hashPageCurrent);
        // let d = {}
        // d[keyBasket] = getLocalStorage(keyBasket); // (keyBasket in lsPage) ? lsPage[keyBasket] : {'items': []};
        // console.log('d:'); console.log(d);
        let basket;
        let createNewBasket = true;
        if (true) { // !isUserLoggedIn) {
            try {
                basket = getLocalStorage(keyBasket);
                console.log('basket found: '); console.log(basket);
                createNewBasket = isEmpty(basket);
            }
            catch {
                
            }
            // lsPage[keyBasket] = ajaxJSONData(keyBasket, hashStoreBasketLoad, d, loadBasket, false);
        }
        else {
            // store basket from server in localStorage
            
        }
        if (createNewBasket) {
            basket = {};
            basket[keyItems] = [];
            basket[keyIsIncludedVAT] = true;
            basket[keyIdCurrency] = 1;
            basket[keyIdRegionDelivery] = 1;
            setLocalStorage(keyBasket, basket);
            console.log("new local basket created");
        }
        let ajaxData = {}
        ajaxData[keyBasket] = basket;
        // console.log("hookupLocalStorageStore\nhashStoreBasketLoad: " + hashStoreBasketLoad + "\n");
        // ajaxData[keyIsIncludedVAT] = getLocalStorage(keyIsIncludedVAT);
        console.log('ajax:' + ajaxData);
        ajaxJSONData(keyBasket, mapHashToController(hashStoreBasketLoad), ajaxData, loadBasket, false);
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
    toggleShowButtonCheckout() { // containerBasket
        
        console.log("toggling checkout button");

        const btnCheckout = document.querySelectorAll(idButtonCheckout);
        const labelBasketEmpty = document.querySelectorAll(idLabelBasketEmpty);

        // let lsPage = getPageLocalStorage(hashPageCurrent);
        // let basket = lsPage[keyBasket]['items'];
        // let products = containerBasket.filter('');
        let basket = getLocalStorage(keyBasket);

        if (basket['items'].length == 0) {
            btnCheckout.style.display = "none";
            labelBasketEmpty.style.display = "";
        } else {
            btnCheckout.style.display = "";
            labelBasketEmpty.style.display = "none";
        }
    }
    hookupButtonCheckout() {

        console.log("hooking up checkout button");

        const btnCheckout = document.querySelectorAll(idButtonCheckout);
        // let lsPage = getPageLocalStorage(hashPageCurrent);
        initialiseEventHandler(btnCheckout, flagInitialised, function() {
            btnCheckout.addEventListener("click", function() {
                /*
                //setupPageLocalStorageNext(hashPageStoreBasket);
                let basket = getLocalStorage(keyBasket);
                // goToPage(hashPageStoreBasket);
                let ajaxData = {};
                ajaxData[keyBasket] = basket;

                ajaxJSONData('checkout', mapHashToController(hashPageStoreBasket), ajaxData, null, false);
                */
            goToPage(hashPageStoreBasket);
            });
        });
    }
    hookupBasketItemPlusAndMinusButtons() {
        const minVal = 1;
        // Basket Add
        // Increment
        document.querySelectorAll('div.btn-increment[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function() {
            let elButton = this;
            initialiseEventHandler(elButton, flagInitialised, function(){
                elButton.addEventListener("click", function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                    let elInput = document.querySelectorAll(getFormProductSelector(typeFormBasketAdd, elButton)).querySelector('input[type="number"]');
                    // console.log('input selector ='); console.log('form[' + attrFormType + '=' + elButton.attr(attrFormType) + '][' + attrIdProduct + '=' + elButton.attr(attrIdProduct) + ']');
                    let newVal = parseInt(getElementCurrentValue(elInput));
                    if (isNaN(newVal)) newVal = minVal;
                    newVal += 1;
                    elInput.val(newVal);
                });
            });
        });
        // Decrement
        document.querySelectorAll('div.btn-decrement[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function() {
            let elButton = this;
            initialiseEventHandler(elButton, flagInitialised, function(){
                elButton.addEventListener("click", function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                    // let product = document.querySelectorAll('.card.subcard[' + attrIdProduct +'=' + elButton.attr(attrIdProduct) + ']');
                    let elInput= document.querySelectorAll(getFormProductSelector(typeFormBasketAdd, elButton)).querySelector('input[type="number"]');
                    let newVal = parseInt(getElementCurrentValue(elInput));
                    if (isNaN(newVal)) newVal = minVal;
                    newVal = Math.max(minVal, newVal - 1);
                    elInput.val(newVal);
                });
            });
        });

        // Basket Edit
        // Increment
        document.querySelectorAll('div.btn-increment[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function() {
            let elButton = this;
            initialiseEventHandler(elButton, flagInitialised, function(){
                elButton.addEventListener("click", function(event) {
                    event.stopPropagation();
                    // basketItem = document.querySelectorAll('.card.subcard[' + attrIdProduct +'=' + elButton.attr(attrIdProduct) + ']');
                    let elInput = document.querySelectorAll(getFormProductSelector(typeFormBasketEdit, elButton)).querySelector('input[type="number"]');
                    // console.log('input selector ='); console.log('form[' + attrFormType + '=' + elButton.attr(attrFormType) + '][' + attrIdProduct + '=' + elButton.attr(attrIdProduct) + ']');
                    let newVal = parseInt(getElementCurrentValue(elInput));
                    if (isNaN(newVal)) newVal = minVal;
                    newVal += 1;
                    elInput.val(newVal);
                    elInput.trigger("change");
                });
            });
        });
        // Decrement
        document.querySelectorAll('div.btn-decrement[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function() {
            let elButton = this;
            initialiseEventHandler(elButton, flagInitialised, function(){
                elButton.addEventListener("click", function(event) {
                    event.stopPropagation();
                    let elInput= document.querySelectorAll(getFormProductSelector(typeFormBasketEdit, elButton)).querySelector('input[type="number"]');
                    let newVal = parseInt(getElementCurrentValue(elInput));
                    if (isNaN(newVal)) newVal = minVal;
                    newVal = Math.max(minVal, newVal - 1);
                    elInput.val(newVal);
                    elInput.trigger("change");
                });
            });
        });
    }
    hookupBasketAddInputs() {
        
        document.querySelectorAll('form[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function() {
            let elForm = this;
            let elInput = elForm.querySelector('input[type="number"]');
            initialiseEventHandler(elInput, flagInitialised, function(){
                elInput.addEventListener("change", function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                });
                elInput.addEventListener("click", function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                });
            });
        });
    }
    hookupBasketEditInputs() {
        
        // let elButton, elInput, newVal, product;
        const minVal = 1;
        // Basket Edit
        // Increment
        document.querySelectorAll('form[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function() {
            let elForm = this;
            let elInput = elForm.querySelector('input[type="number"]');
            initialiseEventHandler(elInput, flagInitialised, function(){
                elInput.addEventListener("change", function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                    // let lsPage = getPageLocalStorageCurrent();
                    d = {};
                    d[keyBasket]= getLocalStorage(keyBasket); // lsPage[keyBasket]; // JSON.parse(lsPage[keyBasket]);
                    d[keyIdProduct] = elForm.attr(attrIdProduct); // lsPage[keyIdProduct];
                    d[keyIdPermutation] = elForm.attr(attrIdPermutation);
                    // d[keyQuantity] = lsPage[keyQuantity];
                    d[keyForm] = convertForm2JSON(elForm);
                    d[keyForm][keyQuantity] = elInput.val();
                    console.log('sending data to basket edit controller: '); console.log(d);
                    ajaxJSONData('basket update', mapHashToController(hashStoreBasketEdit), d, loadBasket, false);
                });
            });
        });
    }
    hookupDeleteBasketItemButtons() {
        
        console.log('hooking up basket item delete buttons');
        // let elForm, elDelete;
        // const minVal = 1;
        // Basket Add
        // Increment
        document.querySelectorAll('form[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function() {
            let elForm = this;
            let elDelete = elForm.querySelector('a.' + flagBasketItemDelete);
            initialiseEventHandler(elDelete, flagInitialised, function(){
                elDelete.addEventListener("click", function(event) {
                    event.stopPropagation();
                    ajaxData = {};
                    ajaxData[keyBasket]= getLocalStorage(keyBasket);
                    ajaxData[keyIdProduct] = elForm.attr(attrIdProduct);
                    ajaxData[keyIdPermutation] = elForm.attr(attrIdPermutation);
                    console.log('sending data to basket delete controller: '); console.log(ajaxData);
                    ajaxJSONData('basket update', mapHashToController(hashStoreBasketDelete), ajaxData, loadBasket, false);
                });
            });
        });
    }

    /*
    getBasket() {

        lsShared = getPageLocalStorage(keyShared);

        return lsShared[keyBasket];
    }
    */

    hookupButtonsAdd2Basket() {

        // let product, btn, lsPage;
        // [' + attrIdProduct + '=' + elButton.attr(attrIdProduct) + ']
        document.querySelectorAll('form[' + attrFormType + '="' + typeFormBasketAdd +'"]').each(function() {
        
            var form = this;

            initialiseEventHandler(form, flagInitialised, function() {
                // form = document.querySelectorAll(form);
                form.submit(function(event) {
                    event.preventDefault();

                    // lsShared = getPageLocalStorage(keyShared);
                    console.log("adding to basket for product ID: ", form.attr(attrIdProduct));

                    ajaxData = {};
                    ajaxData[keyIdProduct] = form.attr(attrIdProduct);
                    ajaxData[keyIdPermutation] = form.attr(attrIdPermutation);
                    basket = getLocalStorage(keyBasket);
                    ajaxData[keyBasket] = basket; // lsShared[keyBasket];
                    console.log("basket before add: ", basket);
                    ajaxData[keyForm] = convertForm2JSON(form); // formData; // form.serialize();
                    console.log("ajax data:"); console.log(ajaxData);
                    ajaxJSONData('add2Basket', mapHashToController(hashStoreBasketAdd), ajaxData, loadBasket, false); // { product_id: form.attr(attrIdProduct), basket_local: lsPage[keyBasket] , }
                });
                console.log("basket add method added for product ID: ", form.attr(attrIdProduct));
            });
        });
    }

    loadBasket(response) {

        let basketContainer = document.querySelectorAll(idBasketContainer);
        // let lsPage = getPageLocalStorage(hashPageCurrent);
        // let lsShared = getPageLocalStorage(keyShared);

        console.log('ajax:'); console.log(response.data);

        let basket = response.data[keyBasket]; // JSON.parse(response.data[keyBasket]);
        // setPageLocalStorage(keyShared, lsShared);
        setLocalStorage(keyBasket, basket);
        items = basket['items'];
        // console.log('old basket:'); console.log(basketContainer.innerHTML);
        // console.log('setting basket:'); console.log(response.data['html_block']);
        basketContainer.innerHTML = response.data['html_block'];
        
        /*
        if (items.length > 0) {
            let basketItem;
            for (let indexItemBasket = 0; indexItemBasket < items.length; indexItemBasket++) {
                basketItem = items[indexItemBasket];
                if (basketItem[keyQuantity] > 1) {
                    elInput = basketContainer.querySelector('form[' + attrFormType + '=' + typeFormBasketEdit + ']').querySelector('input[type="number"]');
                    // todo : what is missing?
                    elInput.val(basketItem[keyQuantity]);
                }
            }
        }
        */
    
        hookupBasket();
    }

    getFormProductSelector(typeForm, elementInForm) {
        idPermutation = elementInForm.attr(attrIdPermutation);
        console.log('idPermutation: ', idPermutation);
        hasPermutation = !isEmpty(idPermutation);
        console.log('has permutation: ', hasPermutation);
        selectorIdPermutation = hasPermutation ? '[' + attrIdPermutation + '=' + idPermutation + ']' : '';
        return 'form[' + attrFormType + '="' + typeForm + '"][' + attrIdProduct + '=' + elementInForm.attr(attrIdProduct) + ']' + selectorIdPermutation;
    }



    getCurrencySelected() {
        let elementSelectorCurrency = document.querySelectorAll(idSelectorCurrency);
        let selectedCurrency = elementSelectorCurrency.val();
        console.log("selected currency: ", selectedCurrency);
        return selectedCurrency;
    }

    addMetadataBasketToJSON(jsonData) {
        jsonData[keyIdCurrency] = getLocalStorage(keyIdCurrency);
        jsonData[keyIdRegionDelivery] = getLocalStorage(keyIdRegionDelivery);
        jsonData[keyIsIncludedVAT] = getLocalStorage(keyIsIncludedVAT);
        return jsonData;
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
        let lsOld = getPageLocalStorage(hashPageCurrent);
        hashPageCurrent = pageHashNext;
        clearPageLocalStorage(hashPageCurrent);
        setupPageLocalStorage(hashPageCurrent);
        let lsNew = getPageLocalStorage(hashPageCurrent);
        lsNew[keyBasket] = (keyBasket in lsOld) ? lsOld[keyBasket] : {'items': []};
        setPageLocalStorage(hashPageCurrent, lsNew);
    }

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