

function hookupStore() {
    console.log('hookup store start');
    console.log(_pathHost);
    hookupLocalStorageStore();
    hookupBasket();
    hookupBtnsAdd2Basket();
}

function hookupBasket() {
    
    // const containerBasket = $(idContainerBasket);

    toggleShowBtnCheckout(); // containerBasket
    hookupBtnCheckout();
    hookupBtnsPlusMinus();
    hookupBasketAddInputs();
    hookupBasketEditInputs();
    hookupBtnsDelete();
}

function hookupLocalStorageStore() {

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
        basket = {'items': []};
        setLocalStorage(keyBasket, basket);
        console.log("new local basket created");
    }
    let ajaxData = {}
    ajaxData[keyBasket] = basket;
    // console.log('ajax:' + ajaxData);
    ajaxJSONData(keyBasket, mapHashToController(hashStoreBasketLoad), ajaxData, loadBasket, false);
}

/*
function setupPageLocalStorageNextStore(pageHashNext) {
    let lsOld = getPageLocalStorage(hashPageCurrent);
    hashPageCurrent = pageHashNext;
    clearPageLocalStorage(hashPageCurrent);
    setupPageLocalStorage(hashPageCurrent);
    let lsNew = getPageLocalStorage(hashPageCurrent);
    lsNew[keyBasket] = (keyBasket in lsOld) ? lsOld[keyBasket] : {'items': []};
    setPageLocalStorage(hashPageCurrent, lsNew);
}

function goToPageStore(pageHash, parameters_dict) {
    
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

function toggleShowBtnCheckout() { // containerBasket
    
    console.log("toggling checkout button");

    const btnCheckout = $(idBtnCheckout);
    const labelBasketEmpty = $(idLabelBasketEmpty);

    // let lsPage = getPageLocalStorage(hashPageCurrent);
    // let basket = lsPage[keyBasket]['items'];
    // let products = containerBasket.filter('');
    let basket = getLocalStorage(keyBasket);

    if (basket['items'].length == 0) {
        btnCheckout.hide();
        labelBasketEmpty.show();
    } else {
        btnCheckout.show();
        labelBasketEmpty.hide();
    }
}

/*
function getBasket() {

    lsShared = getPageLocalStorage(keyShared);

    return lsShared[keyBasket];
}
*/

function hookupBtnsAdd2Basket() {

    // let product, btn, lsPage;
    // [' + attrIdProduct + '=' + elBtn.attr(attrIdProduct) + ']
    $('form[' + attrFormType + '="' + typeFormBasketAdd +'"]').each(function() {
    
        var form = $(this);

        initialiseEventHandler(form, flagInitialised, function() {
            // form = $(form);
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

function hookupBtnCheckout() {

    console.log("hooking up checkout button");

    const btnCheckout = $(idBtnCheckout);
    // let lsPage = getPageLocalStorage(hashPageCurrent);
    initialiseEventHandler(btnCheckout, flagInitialised, function() {
        btnCheckout.on("click", function() {
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

function loadBasket(response) {

    let basketContainer = $(idBasketContainer);
    // let lsPage = getPageLocalStorage(hashPageCurrent);
    // let lsShared = getPageLocalStorage(keyShared);

    console.log('ajax:'); console.log(response.data);

    let basket = response.data[keyBasket]; // JSON.parse(response.data[keyBasket]);
    // setPageLocalStorage(keyShared, lsShared);
    setLocalStorage(keyBasket, basket);
    items = basket['items'];
    // console.log('old basket:'); console.log(basketContainer.html());
    // console.log('setting basket:'); console.log(response.data['html_block']);
    basketContainer.html(response.data['html_block']);
    
    /*
    if (items.length > 0) {
        let basketItem;
        for (let indexItemBasket = 0; indexItemBasket < items.length; indexItemBasket++) {
            basketItem = items[indexItemBasket];
            if (basketItem[keyQuantity] > 1) {
                elInput = basketContainer.find('form[' + attrFormType + '=' + typeFormBasketEdit + ']').find('input[type="number"]');
                // todo : what is missing?
                elInput.val(basketItem[keyQuantity]);
            }
        }
    }
    */
   
    hookupBasket();
}

function getFormProductSelector(typeForm, elementInForm) {
    idPermutation = elementInForm.attr(attrIdPermutation);
    console.log('idPermutation: ', idPermutation);
    hasPermutation = !isEmpty(idPermutation);
    console.log('has permutation: ', hasPermutation);
    selectorIdPermutation = hasPermutation ? '[' + attrIdPermutation + '=' + idPermutation + ']' : '';
    return 'form[' + attrFormType + '="' + typeForm + '"][' + attrIdProduct + '=' + elementInForm.attr(attrIdProduct) + ']' + selectorIdPermutation;
}

function hookupBtnsPlusMinus() {
    
    // let elBtn, elInput, newVal, product;
    const minVal = 1;
    // Basket Add
    // Increment
    $('div.btn-increment[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function() {
        let elBtn = $(this);
        initialiseEventHandler(elBtn, flagInitialised, function(){
            elBtn.on("click", function(event) {
                event.preventDefault();
                event.stopPropagation();
                let elInput = $(getFormProductSelector(typeFormBasketAdd, elBtn)).find('input[type="number"]');
                // console.log('input selector ='); console.log('form[' + attrFormType + '=' + elBtn.attr(attrFormType) + '][' + attrIdProduct + '=' + elBtn.attr(attrIdProduct) + ']');
                let newVal = parseInt(getElementCurrentValue(elInput));
                if (isNaN(newVal)) newVal = minVal;
                newVal += 1;
                elInput.val(newVal);
            });
        });
    });
    // Decrement
    $('div.btn-decrement[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function() {
        let elBtn = $(this);
        initialiseEventHandler(elBtn, flagInitialised, function(){
            elBtn.on("click", function(event) {
                event.preventDefault();
                event.stopPropagation();
                // let product = $('.card.subcard[' + attrIdProduct +'=' + elBtn.attr(attrIdProduct) + ']');
                let elInput= $(getFormProductSelector(typeFormBasketAdd, elBtn)).find('input[type="number"]');
                let newVal = parseInt(getElementCurrentValue(elInput));
                if (isNaN(newVal)) newVal = minVal;
                newVal = Math.max(minVal, newVal - 1);
                elInput.val(newVal);
            });
        });
    });

    // Basket Edit
    // Increment
    $('div.btn-increment[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function() {
        let elBtn = $(this);
        initialiseEventHandler(elBtn, flagInitialised, function(){
            elBtn.on("click", function(event) {
                event.stopPropagation();
                // basketItem = $('.card.subcard[' + attrIdProduct +'=' + elBtn.attr(attrIdProduct) + ']');
                let elInput = $(getFormProductSelector(typeFormBasketEdit, elBtn)).find('input[type="number"]');
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
    $('div.btn-decrement[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function() {
        let elBtn = $(this);
        initialiseEventHandler(elBtn, flagInitialised, function(){
            elBtn.on("click", function(event) {
                event.stopPropagation();
                let elInput= $(getFormProductSelector(typeFormBasketEdit, elBtn)).find('input[type="number"]');
                let newVal = parseInt(getElementCurrentValue(elInput));
                if (isNaN(newVal)) newVal = minVal;
                newVal = Math.max(minVal, newVal - 1);
                elInput.val(newVal);
                elInput.trigger("change");
            });
        });
    });
}

function hookupBasketAddInputs() {
    
    $('form[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function() {
        let elForm = $(this);
        let elInput = elForm.find('input[type="number"]');
        initialiseEventHandler(elInput, flagInitialised, function(){
            elInput.on("change", function(event) {
                event.preventDefault();
                event.stopPropagation();
            });
            elInput.on("click", function(event) {
                event.preventDefault();
                event.stopPropagation();
            });
        });
    });
}

function hookupBasketEditInputs() {
    
    // let elBtn, elInput, newVal, product;
    const minVal = 1;
    // Basket Edit
    // Increment
    $('form[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function() {
        let elForm = $(this);
        let elInput = elForm.find('input[type="number"]');
        initialiseEventHandler(elInput, flagInitialised, function(){
            elInput.on("change", function(event) {
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

function hookupBtnsDelete() {
    
    console.log('hooking up basket item delete buttons');
    // let elForm, elDelete;
    // const minVal = 1;
    // Basket Add
    // Increment
    $('form[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function() {
        let elForm = $(this);
        let elDelete = elForm.find('a.' + flagBasketItemDelete);
        initialiseEventHandler(elDelete, flagInitialised, function(){
            elDelete.on("click", function(event) {
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

function getCurrencySelected() {
    let elementSelectorCurrency = $(idSelectorCurrency);
    let selectedCurrency = elementSelectorCurrency.val();
    console.log("selected currency: ", selectedCurrency);
    return selectedCurrency;
}

function addMetadataBasketToJSON(jsonData) {
    jsonData[keyIdCurrency] = getLocalStorage(keyIdCurrency);
    jsonData[keyIdRegionDelivery] = getLocalStorage(keyIdRegionDelivery);
    jsonData[keyIsIncludedVAT] = getLocalStorage(keyIsIncludedVAT);
    return jsonData;
}