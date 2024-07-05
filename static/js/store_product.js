var _loading = true;
var _rowBlank = null;

function hookupStorePageProduct() {
    _loading = false;
    hookupFilters();
    hookupTableMain();
}

function hookupFilters() {
    let filterCategory = $(idFilterCategory);
    initialiseEventHandler(filterCategory, flagInitialised, function() {
        listCategories.forEach(function(category) {
            let option = document.createElement('option');
            option.value = category.value;
            option.text = category.text;
            filterCategory.append(option);
        });
        filterCategory.on("change", function(event) {
            event.stopPropagation();
            loadFilteredPermutations();
        });
    });

    let filterProduct = $(idFilterProduct);
    initialiseEventHandler(filterProduct, flagInitialised, function() {
        listProducts.forEach(function(product) {
            if (product.category != getElementCurrentValue($(idFilterCategory))) return;
            let option = document.createElement('option');
            option.value = category.value;
            option.text = category.text;
            filterProduct.append(option);
        });
        filterProduct.on("change", function(event) {
            event.stopPropagation();
            loadFilteredPermutations();
        });
    });
    
    let filterOutOfStock = $(idFilterOutOfStock);
    initialiseEventHandler(filterOutOfStock, flagInitialised, function() {
        filterOutOfStock.on("change", function(event) {
            event.stopPropagation();
            loadFilteredPermutations();
        });
    });

    let filterQuantityMin = $(idFilterQuantityMin);
    initialiseEventHandler(filterQuantityMin, flagInitialised, function() {
        filterQuantityMin.on("change", function(event) {
            event.stopPropagation();
            loadFilteredPermutations();
        });
    });
    
    let filterQuantityMax = $(idFilterQuantityMax);
    initialiseEventHandler(filterQuantityMax, flagInitialised, function() {
        filterQuantityMax.on("change", function(event) {
            event.stopPropagation();
            loadFilteredPermutations();
        });
    });
}

function loadPermutations() {

    let ajaxData = {};
    ajaxData[keyIdCategory] = getElementCurrentValue($(idFilterCategory));
    ajaxData[keyIdProduct] = getElementCurrentValue($(idFilterProduct));
    ajaxData[keyIsOutOfStock] = getElementCurrentValue($(idFilterOutOfStock));
    ajaxData[keyQuantityMin] = getElementCurrentValue($(idFilterQuantityMin));
    ajaxData[keyQuantityMax] = getElementCurrentValue($(idFilterQuantityMax));

    ajaxJSONData('permutations', mapHashToController(hashStoreProduct), ajaxData, callbackLoadPermutations, false);
}

function callbackLoadPermutations(response) {
    
    console.log('ajax:'); console.log(response.data);

    let table = $(idTableMain);
    let bodyTable, row;

    table.find('tr').remove(); // :not(.' + flagRowNew + ')
    bodyTable = table.find('tbody');

    foreach(response.data, function(index, dataRow) { 
        row = _rowBlank.cloneNode(true);
        row = $(row);
        row.removeClass(flagRowNew);
        row.find('td.' + flagCategory).val(dataRow[flagCategory]);
        row.find('td.' + flagProduct).val(dataRow[flagProduct]);
        row.find('td.' + flagVariations).val(dataRow[flagVariations]);
        row.find('td.' + flagQuantityStock).val(dataRow[flagQuantityStock]);
        row.find('td.' + flagQuantityMin).val(dataRow[flagQuantityMin]);
        row.find('td.' + flagQuantityMax).val(dataRow[flagQuantityMax]);
        row.find('td.' + flagCostLocal).val(dataRow[flagCostLocal]);
        row.attr(attrIdCategory, dataRow[flagCategory]);
        row.attr(attrIdProduct, dataRow[flagProduct]);
        row.attr(attrIdPermutation, dataRow[attrIdPermutation]);
        bodyTable.append(row);
    });
    
}

function hookupTableMain() {
    let table = $(idTableMain);
    let rowBlankTemp = table.find('tr.' + flagRowNew);
    console.log("row blank temp: ", rowBlankTemp);
    _rowBlank = rowBlankTemp[0].cloneNode(true);
    table.find('tr.' + flagRowNew).remove();
}