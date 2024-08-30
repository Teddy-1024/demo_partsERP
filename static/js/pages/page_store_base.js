
import { PageBase } from "./page_base.js";

export class PageStoreHome extends PageBase {
    constructor() {
        super();
    }

    sharedInitialize() {
        super.sharedInitialize();
        this.hookupFiltersStore();
        this.hookupStoreHome();
    }


    hookupStore() {
        console.log('hookup store start');
        console.log(_pathHost);
        hookupLocalStorageStore();
        hookupBasket();
        hookupBtnsAdd2Basket();
    }

    hookupBasket() {
        
        // const containerBasket = document.querySelectorAll(idContainerBasket);
        toggleShowBtnCheckout(); // containerBasket
        hookupBtnCheckout();
        hookupBtnsPlusMinus();
        hookupBasketAddInputs();
        hookupBasketEditInputs();
        hookupBtnsDelete();
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

    /*
    setupPageLocalStorageNextStore(pageHashNext) {
        let lsOld = getPageLocalStorage(hashPageCurrent);
        hashPageCurrent = pageHashNext;
        clearPageLocalStorage(hashPageCurrent);
        setupPageLocalStorage(hashPageCurrent);
        let lsNew = getPageLocalStorage(hashPageCurrent);
        lsNew[keyBasket] = (keyBasket in lsOld) ? lsOld[keyBasket] : {'items': []};
        setPageLocalStorage(hashPageCurrent, lsNew);
    }

    goToPageStore(pageHash, parameters_dict) {
        
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

    toggleShowBtnCheckout() { // containerBasket
        
        console.log("toggling checkout button");

        const btnCheckout = document.querySelectorAll(idBtnCheckout);
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

    /*
    getBasket() {

        lsShared = getPageLocalStorage(keyShared);

        return lsShared[keyBasket];
    }
    */

    hookupBtnsAdd2Basket() {

        // let product, btn, lsPage;
        // [' + attrIdProduct + '=' + elBtn.attr(attrIdProduct) + ']
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

    hookupBtnCheckout() {

        console.log("hooking up checkout button");

        const btnCheckout = document.querySelectorAll(idBtnCheckout);
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

    hookupBtnsPlusMinus() {
        
        // let elBtn, elInput, newVal, product;
        const minVal = 1;
        // Basket Add
        // Increment
        document.querySelectorAll('div.btn-increment[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function() {
            let elBtn = this;
            initialiseEventHandler(elBtn, flagInitialised, function(){
                elBtn.addEventListener("click", function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                    let elInput = document.querySelectorAll(getFormProductSelector(typeFormBasketAdd, elBtn)).querySelector('input[type="number"]');
                    // console.log('input selector ='); console.log('form[' + attrFormType + '=' + elBtn.attr(attrFormType) + '][' + attrIdProduct + '=' + elBtn.attr(attrIdProduct) + ']');
                    let newVal = parseInt(getElementCurrentValue(elInput));
                    if (isNaN(newVal)) newVal = minVal;
                    newVal += 1;
                    elInput.val(newVal);
                });
            });
        });
        // Decrement
        document.querySelectorAll('div.btn-decrement[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function() {
            let elBtn = this;
            initialiseEventHandler(elBtn, flagInitialised, function(){
                elBtn.addEventListener("click", function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                    // let product = document.querySelectorAll('.card.subcard[' + attrIdProduct +'=' + elBtn.attr(attrIdProduct) + ']');
                    let elInput= document.querySelectorAll(getFormProductSelector(typeFormBasketAdd, elBtn)).querySelector('input[type="number"]');
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
            let elBtn = this;
            initialiseEventHandler(elBtn, flagInitialised, function(){
                elBtn.addEventListener("click", function(event) {
                    event.stopPropagation();
                    // basketItem = document.querySelectorAll('.card.subcard[' + attrIdProduct +'=' + elBtn.attr(attrIdProduct) + ']');
                    let elInput = document.querySelectorAll(getFormProductSelector(typeFormBasketEdit, elBtn)).querySelector('input[type="number"]');
                    // console.log('input selector ='); console.log('form[' + attrFormType + '=' + elBtn.attr(attrFormType) + '][' + attrIdProduct + '=' + elBtn.attr(attrIdProduct) + ']');
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
            let elBtn = this;
            initialiseEventHandler(elBtn, flagInitialised, function(){
                elBtn.addEventListener("click", function(event) {
                    event.stopPropagation();
                    let elInput= document.querySelectorAll(getFormProductSelector(typeFormBasketEdit, elBtn)).querySelector('input[type="number"]');
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
        
        // let elBtn, elInput, newVal, product;
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

    hookupBtnsDelete() {
        
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
}