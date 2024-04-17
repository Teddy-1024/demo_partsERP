var _loading = true; 

function hookupStorePageHome() {
    _loading = false;

    hookupStoreCardsProduct();
}

function hookupStoreCardsProduct() {
    
    let d; // , lsShared;
    // let selectorCardProduct = '.card.subcard';
    $('div.card.subcard[' + attrIdProduct +']').each(function() {

        var product = $(this);
        initialiseEventHandler(product, flagInitialised, function() {
            product = $(product);
            console.log("initialising product: ", product);
            product.on("click", function(event) {
                // d = { keyIdProduct: product.attr(attrIdProduct) }
                var elemClicked = event.target;
                if (elemClicked.id != 'submit') { // disable for submit buttons
                    console.log("product click: " + product.attr(attrIdProduct));
                    console.log("permutation click: " + product.attr(attrIdPermutation));
                    var d = {}
                    d[keyIdProduct] = product.attr(attrIdProduct)
                    d[keyIdPermutation] = product.attr(attrIdPermutation)
                    // send quantity requested
                    goToPage(hashPageStoreProduct, d);
                }
            });
            console.log("click method added for product ID: " + product.attr(attrIdProduct) + ', permutation ID: ', product.attr(attrIdPermutation));
        });
    });
}
