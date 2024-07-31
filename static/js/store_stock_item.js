var _loading = true;
var _rowBlank = null;

function hookupStorePageProductPermutation() {
    _loading = false;
    hookupFilters();
    hookupButtonsSaveCancel();
    hookupTableMain();
    hookupOverlayConfirm(savePermutations);
}

function hookupFilters() {
    let filterCategory = $(idFilterCategory);
    initialiseEventHandler(filterCategory, flagInitialised, function() {
        console.log("hooking up filter category");
        filterCategory = $(filterCategory);
        /*
        listCategories.forEach(function(category) {
            console.log('adding category: ', category.value, category.text);
            /*
            let option = document.createElement('option');
            option.value = category.value;
            option.text = category.text;
            *
           filterCategory.append($('<option>', category));
        });
        console.log(listCategories);
        */
        filterCategory.on("change", function(event) {
            loadPermutations();
        });
        console.log("hooked up filter category");
    });

    let filterProduct = $(idFilterProduct);
    initialiseEventHandler(filterProduct, flagInitialised, function() {
        listProducts.forEach(function(product) {
            if (product[attrIdCategory] != getElementCurrentValue($(idFilterCategory))) return;
            /*
            let option = document.createElement('option');
            option.value = product.value;
            option.text = product.text;
            */
           filterProduct.append($('<option>', product));
        });
        filterProduct.on("change", function(event) {
            loadPermutations();
        });
    });
    
    let filterIsOutOfStock = $(idFilterIsOutOfStock);
    initialiseEventHandler(filterIsOutOfStock, flagInitialised, function() {
        filterIsOutOfStock.on("change", function(event) {
            loadPermutations();
        });
    });

    let filterQuantityMin = $(idFilterQuantityMin);
    initialiseEventHandler(filterQuantityMin, flagInitialised, function() {
        filterQuantityMin.on("change", function(event) {
            loadPermutations();
        });
    });
    
    let filterQuantityMax = $(idFilterQuantityMax);
    initialiseEventHandler(filterQuantityMax, flagInitialised, function() {
        filterQuantityMax.on("change", function(event) {
            loadPermutations();
        });
    });
}

function loadPermutations() {

    let elForm = $(idFormFiltersPermutations);
    let ajaxData = {};
    ajaxData[keyForm] = convertForm2JSON(elForm);
    ajaxData.csrf_token = ajaxData[keyForm].csrf_token;
    /*
    ajaxData[attrIdCategory] = getElementCurrentValue($(idFilterCategory));
    ajaxData[attrIdProduct] = getElementCurrentValue($(idFilterProduct));
    ajaxData[flagIsOutOfStock] = getElementCurrentValue($(idFilterIsOutOfStock));
    ajaxData[flagQuantityMin] = getElementCurrentValue($(idFilterQuantityMin));
    ajaxData[flagQuantityMax] = getElementCurrentValue($(idFilterQuantityMax));
    */

    console.log('ajaxData:'); console.log(ajaxData);

    ajaxJSONData('permutations', mapHashToController(hashPageStorePermutationsPost), ajaxData, callbackLoadPermutations, false, {"X-CSRFToken": ajaxData.csrf_token});
}

function callbackLoadPermutations(response) {
    
    console.log('ajax:'); console.log(response.data);

    let table = $(idTableMain);
    let bodyTable, row, dllCategory, ddlProduct;

   // table.find('tr').remove(); // :not(.' + flagRowNew + ')
    bodyTable = table.find('tbody');
    bodyTable.find('tr').remove(); 

    $.each(response.data, function(_, dataRow) { 
        row = _rowBlank.cloneNode(true);
        row = $(row);
        row.removeClass(flagRowNew);
        console.log("applying data row: ", dataRow);
        dllCategory = row.find('td.' + flagCategory + ' select');
        dllCategory.val(dataRow[attrIdCategory]);
        ddlProduct = row.find('td.' + flagProduct + ' select');
        listProducts.forEach(function(product) {
            if (product[attrIdCategory] != dataRow[attrIdCategory]) return;
            ddlProduct.append($('<option>', product));
        });
        ddlProduct.val(dataRow[attrIdProduct]);
        row.find('td.' + flagVariations + ' textarea').val(dataRow[flagVariations]);
        row.find('td.' + flagQuantityStock + ' input').val(dataRow[flagQuantityStock]);
        row.find('td.' + flagQuantityMin + ' input').val(dataRow[flagQuantityMin]);
        row.find('td.' + flagQuantityMax + ' input').val(dataRow[flagQuantityMax]);
        row.find('td.' + flagCostLocal).html(dataRow[flagCostLocal]);
        row.attr(attrIdCategory, dataRow[flagCategory]);
        row.attr(attrIdProduct, dataRow[flagProduct]);
        row.attr(attrIdPermutation, dataRow[attrIdPermutation]);
        bodyTable.append(row);
    });
    
}

function hookupButtonsSaveCancel() {
    let btnSave = $(idButtonSave);
    let btnCancel = $(idButtonCancel);
    let btnAdd = $(idButtonAdd);

    btnSave.on("click", function(event) {
        event.stopPropagation();
        showOverlayConfirm();
    });
    btnSave.addClass(flagCollapsed);

    btnCancel.on("click", function(event) {
        event.stopPropagation();
        loadPermutations();
    });
    btnCancel.addClass(flagCollapsed);

    btnAdd.on("click", function(event) {
        event.stopPropagation();
        let table = $(idTableMain);
        let row = _rowBlank.cloneNode(true);
        row = $(row);
        row.removeClass(flagRowNew);
        table.find('tbody').append(row);
    });
}

function savePermutations() {

    let permutations = getPermutations(true);
    
    if (permutations.length == 0) {
        showOverlayError('No permutations to save');
        return;
    }

    let ajaxData = {};
    ajaxData[keyPermutations] = permutations;
    ajaxData[keyForm] = convertForm2JSON(elForm);
    ajaxData.csrf_token = ajaxData[keyForm].csrf_token;
    ajaxData.comment = $(idTextareaConfirm).val();

    console.log('ajaxData:'); console.log(ajaxData);
    ajaxJSONData('permutations', mapHashToController(hashPageStorePermutationsPost), ajaxData, callbackLoadPermutations, false, {});
}

function getPermutations(dirtyOnly) {
    let table = $(idTableMain);
    let permutations = [];
    let row, permutation, ddlCategory, ddlProduct, variations, quantityStock, quantityMin, quantityMax, costLocal;
    table.find('tbody tr').each(function(index, row) {
        row = $(row);
        if (dirtyOnly && !row.hasClass(flagDirty)) return;

        ddlCategory = row.find('td.' + flagCategory + ' select');
        ddlProduct = row.find('td.' + flagProduct + ' select');
        variations = row.find('td.' + flagVariations + ' textarea');
        quantityStock = row.find('td.' + flagQuantityStock + ' input');
        quantityMin = row.find('td.' + flagQuantityMin + ' input');
        quantityMax = row.find('td.' + flagQuantityMax + ' input');

        permutation = {};
        permutation[attrIdCategory] = ddlCategory.attr(attrValueCurrent);
        permutation[attrIdProduct] = ddlProduct.attr(attrValueCurrent);
        permutation[attrIdPermutation] = row.attr(attrIdPermutation)
        permutation[flagVariations] = variations.attr(attrValueCurrent);
        permutation[flagQuantityStock] = quantityStock.attr(attrValueCurrent);
        permutation[flagQuantityMin] = quantityMin.attr(attrValueCurrent);
        permutation[flagQuantityMax] = quantityMax.attr(attrValueCurrent);
        permutations.push(permutation);
    });
    return permutations;
}

function hookupTableMain() {
    let table = $(idTableMain);
    let rowBlankTemp = table.find('tr.' + flagRowNew);
    console.log("row blank temp: ", rowBlankTemp);
    _rowBlank = rowBlankTemp[0].cloneNode(true);
    table.find('tr.' + flagRowNew).remove();

    /*
    let ddlCategory, ddlProduct;
    let optionsCategory = $(idFilterCategory + ' option');
    optionsCategory.

    console.log('optionsCategory:', optionsCategory);

    table.find('tbody tr').each(function(index, row) {
        console.log("hooking up row ", index);
        row = $(row);
        ddlCategory = row.find('td.' + flagCategory + ' select');
        ddlProduct = row.find('td.' + flagProduct + ' select');
        
        optionsCategory.clone().appendTo(ddlCategory);

        /*
        listProducts.forEach(function(product) {
            if (product[attrIdCategory] != getElementCurrentValue(ddlCategory)) return;
            ddlProduct.append($('<option>', product));
        });
        *
    });
    */

    let ddlCategory, ddlProduct, variations, quantityStock, quantityMin, quantityMax, costLocal;
    table.find('tbody tr').each(function(index, row) {
        console.log("hooking up row ", index);
        row = $(row);
        ddlCategory = row.find('td.' + flagCategory + ' select');
        ddlProduct = row.find('td.' + flagProduct + ' select');
        variations = row.find('td.' + flagVariations + ' textarea');
        quantityStock = row.find('td.' + flagQuantityStock + ' input');
        quantityMin = row.find('td.' + flagQuantityMin + ' input');
        quantityMax = row.find('td.' + flagQuantityMax + ' input');
        
        initialiseEventHandler(ddlCategory, flagInitialised, function() {
            // ddlCategory = $(ddlCategory);
            ddlCategory.on('change', function() {
                /*
                ddlCategory.attr(attrValuePrevious, ddlCategory.attr(attrValueCurrent));
                ddlCategory.attr(attrValueCurrent, ddlCategory.val());
                */
                handleChangeInputPermutations(this);
                ddlCategory = $(this);
                row = getRowFromElement(ddlCategory);
                ddlProduct = row.find('td.' + flagProduct + ' select');
                // ddlProduct = $(ddlProduct);
                ddlProduct.find('option').remove();
                ddlProduct.append($('<option>', {value: '', text: 'Select Product'}));
                listProducts.forEach(function(product) {
                    if (product[attrIdCategory] != getElementCurrentValue(ddlCategory)) return;
                    ddlProduct.append($('<option>', product));
                });
                handleChangeInputPermutations(ddlProduct);
            });
        });

        initialiseEventHandler(ddlProduct, flagInitialised, function() {
            // ddlProduct = $(ddlProduct);
            ddlProduct.on('change', function() {
                handleChangeInputPermutations(this);
            });
        });

        initialiseEventHandler(variations, flagInitialised, function() {
            // variations = $(variations);
            variations.on('change', function() {
                handleChangeInputPermutations(this);
            });
        });

        initialiseEventHandler(quantityStock, flagInitialised, function() {
            // quantityStock = $(quantityStock);
            quantityStock.on('change', function() {
                // console.log(this.value);
                // quantityStock.value = this.value;
                handleChangeInputPermutations(this);
            });
        });

        initialiseEventHandler(quantityMin, flagInitialised, function() {
            // quantityMin = $(quantityMin);
            quantityMin.on('change', function() {
                handleChangeInputPermutations(this);
            });
        });

        initialiseEventHandler(quantityMax, flagInitialised, function() {
            // quantityMax = $(quantityMax);
            quantityMax.on('change', function() {
                handleChangeInputPermutations(this);
            });
        });
    });
}

function handleChangeInputPermutations(element) {
    console.log(element.value);
    let objJQuery = $(element);
    objJQuery.value = element.value;
    let row = getRowFromElement(objJQuery);
    let buttonCancel = $(idButtonCancel);
    let buttonSave = $(idButtonSave);
    let wasDirty = isElementDirty(objJQuery);

    if (objJQuery.hasClass(flagVariations)) {
        objJQuery.attr(attrValueCurrent, getVariationsCurrentValue(objJQuery));
    } else {
        objJQuery.attr(attrValueCurrent, getElementCurrentValue(objJQuery));
    }
    let isDirty = isElementDirty(objJQuery);
    if (wasDirty != isDirty) {
        isRowDirty(row);
        let permutationsDirty = getPermutations(true);
        if (isEmpty(permutationsDirty)) {
            buttonCancel.addClass(flagCollapsed);
            buttonSave.addClass(flagCollapsed);
        } else {
            buttonCancel.removeClass(flagCollapsed);
            buttonSave.removeClass(flagCollapsed);
        }
    }
}

function isRowDirty(row) {
    let ddlCategory = row.find('td.' + flagCategory + ' select');
    let ddlProduct = row.find('td.' + flagProduct + ' select');
    let variations = row.find('td.' + flagVariations + ' textarea');
    let quantityStock = row.find('td.' + flagQuantityStock + ' input');
    let quantityMin = row.find('td.' + flagQuantityMin + ' input');
    let quantityMax = row.find('td.' + flagQuantityMax + ' input');
    
    // return isElementDirty(ddlCategory) || isElementDirty(ddlProduct) || isElementDirty(variations) || isElementDirty(quantityStock) || isElementDirty(quantityMin) || isElementDirty(quantityMax);
    let isDirty = ddlCategory.hasClass(flagDirty) || ddlProduct.hasClass(flagDirty) || variations.hasClass(flagDirty) || 
        quantityStock.hasClass(flagDirty) || quantityMin.hasClass(flagDirty) || quantityMax.hasClass(flagDirty);
    if (isDirty) {
        row.addClass(flagDirty);
    } else {
        row.removeClass(flagDirty);
    }
    return isDirty;
}

function getVariationsCurrentValue(element) {
    let value = element.val();
    let variations = value.split('\n');
    variations = variations.map(function(variation) {
        return variation.trim();
    });
    variations = variations.filter(function(variation) {
        return variation.length > 0;
    });
    return variations.join(',');
}