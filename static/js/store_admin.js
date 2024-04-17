var _loading = true; 

function hookupPageStorePageAdmin() {
    _loading = false;

    hookupBtnProductNew();
    hookupBtnPriceNew();
}

function hookupBtnProductNew() {
    let btnProductNew = $(idBtnProductNew);
    btnProductNew.removeClass(flagInitialised);
    initialiseEventHandler(idBtnProductNew, flagInitialised, function() {
        btnProductNew.on("click", function(event) {
            goToPage(hashPageStoreProductNew);
        });
    });
}

function hookupBtnPriceNew() {
    let btnPriceNew = $(idBtnPriceNew);
    btnPriceNew.removeClass(flagInitialised);
    initialiseEventHandler(idBtnPriceNew, flagInitialised, function() {
        btnPriceNew.on("click", function(event) {
            goToPage(hashPageStorePriceNew);
        });
    });
}