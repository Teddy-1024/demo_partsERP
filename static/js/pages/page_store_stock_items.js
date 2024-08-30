
var _rowBlank = null;

import { PageBase } from "./page_base.js";

export class PageStoreStockItems extends PageBase {
    static hash = hashPageStoreStockItems;

    constructor() {
        super();
    }

    initialize() {
        this.sharedInitialize();
        hookupFilters();
        hookupButtonsSaveCancel();
        hookupTableMain();
        hookupOverlayConfirm(savePermutations);
    }

    hookupFilters() {
        let filterCategory = document.querySelectorAll(idFilterCategory);
        initialiseEventHandler(filterCategory, flagInitialised, function() {
            console.log("hooking up filter category");
            filterCategory = document.querySelectorAll(filterCategory);
            /*
            listCategories.forEach(function(category) {
                console.log('adding category: ', category.value, category.text);
                /*
                let option = document.createElement('option');
                option.value = category.value;
                option.text = category.text;
                *
            filterCategory.appendChild(document.createElement('<option>', category));
            });
            console.log(listCategories);
            */
            filterCategory.addEventListener("change", function(event) {
                loadPermutations();
            });
            console.log("hooked up filter category");
        });

        let filterProduct = document.querySelectorAll(idFilterProduct);
        initialiseEventHandler(filterProduct, flagInitialised, function() {
            listProducts.forEach(function(product) {
                if (product[attrIdCategory] != getElementCurrentValue(document.querySelectorAll(idFilterCategory))) return;
                /*
                let option = document.createElement('option');
                option.value = product.value;
                option.text = product.text;
                */
            filterProduct.appendChild(document.createElement('<option>', product));
            });
            filterProduct.addEventListener("change", function(event) {
                loadPermutations();
            });
        });
        
        let filterIsOutOfStock = document.querySelectorAll(idFilterIsOutOfStock);
        initialiseEventHandler(filterIsOutOfStock, flagInitialised, function() {
            filterIsOutOfStock.addEventListener("change", function(event) {
                loadPermutations();
            });
        });

        let filterQuantityMin = document.querySelectorAll(idFilterQuantityMin);
        initialiseEventHandler(filterQuantityMin, flagInitialised, function() {
            filterQuantityMin.addEventListener("change", function(event) {
                loadPermutations();
            });
        });
        
        let filterQuantityMax = document.querySelectorAll(idFilterQuantityMax);
        initialiseEventHandler(filterQuantityMax, flagInitialised, function() {
            filterQuantityMax.addEventListener("change", function(event) {
                loadPermutations();
            });
        });
    }

    loadPermutations() {

        let elForm = document.querySelectorAll(idFormFiltersPermutations);
        let ajaxData = {};
        ajaxData[keyForm] = convertForm2JSON(elForm);
        ajaxData.csrf_token = ajaxData[keyForm].csrf_token;
        /*
        ajaxData[attrIdCategory] = getElementCurrentValue(document.querySelectorAll(idFilterCategory));
        ajaxData[attrIdProduct] = getElementCurrentValue(document.querySelectorAll(idFilterProduct));
        ajaxData[flagIsOutOfStock] = getElementCurrentValue(document.querySelectorAll(idFilterIsOutOfStock));
        ajaxData[flagQuantityMin] = getElementCurrentValue(document.querySelectorAll(idFilterQuantityMin));
        ajaxData[flagQuantityMax] = getElementCurrentValue(document.querySelectorAll(idFilterQuantityMax));
        */

        console.log('ajaxData:'); console.log(ajaxData);

        ajaxJSONData('permutations', mapHashToController(hashPageStorePermutationsPost), ajaxData, callbackLoadPermutations, false, {"X-CSRFToken": ajaxData.csrf_token});
    }

    callbackLoadPermutations(response) {
        
        console.log('ajax:'); console.log(response.data);

        let table = document.querySelectorAll(idTableMain);
        let bodyTable, row, dllCategory, ddlProduct;

    // table.querySelector('tr').remove(); // :not(.' + flagRowNew + ')
        bodyTable = table.querySelector('tbody');
        bodyTable.querySelector('tr').remove(); 

        $.each(response.data, function(_, dataRow) { 
            row = _rowBlank.cloneNode(true);
            row = document.querySelectorAll(row);
            row.classList.remove(flagRowNew);
            console.log("applying data row: ", dataRow);
            dllCategory = row.querySelector('td.' + flagCategory + ' select');
            dllCategory.val(dataRow[attrIdCategory]);
            ddlProduct = row.querySelector('td.' + flagProduct + ' select');
            listProducts.forEach(function(product) {
                if (product[attrIdCategory] != dataRow[attrIdCategory]) return;
                ddlProduct.appendChild(document.createElement('<option>', product));
            });
            ddlProduct.val(dataRow[attrIdProduct]);
            row.querySelector('td.' + flagVariations + ' textarea').value = dataRow[flagVariations];
            row.querySelector('td.' + flagQuantityStock + ' input').value = dataRow[flagQuantityStock];
            row.querySelector('td.' + flagQuantityMin + ' input').value = dataRow[flagQuantityMin];
            row.querySelector('td.' + flagQuantityMax + ' input').value = dataRow[flagQuantityMax];
            row.querySelector('td.' + flagCostLocal).innerHTML = dataRow[flagCostLocal];
            row.attr(attrIdCategory, dataRow[flagCategory]);
            row.attr(attrIdProduct, dataRow[flagProduct]);
            row.attr(attrIdPermutation, dataRow[attrIdPermutation]);
            bodyTable.appendChild(row);
        });
        
    }

    hookupButtonsSaveCancel() {
        let btnSave = document.querySelectorAll(idButtonSave);
        let btnCancel = document.querySelectorAll(idButtonCancel);
        let btnAdd = document.querySelectorAll(idButtonAdd);

        btnSave.addEventListener("click", function(event) {
            event.stopPropagation();
            showOverlayConfirm();
        });
        btnSave.classList.add(flagCollapsed);

        btnCancel.addEventListener("click", function(event) {
            event.stopPropagation();
            loadPermutations();
        });
        btnCancel.classList.add(flagCollapsed);

        btnAdd.addEventListener("click", function(event) {
            event.stopPropagation();
            let table = document.querySelectorAll(idTableMain);
            let row = _rowBlank.cloneNode(true);
            row = document.querySelectorAll(row);
            row.classList.remove(flagRowNew);
            table.querySelector('tbody').appendChild(row);
        });
    }

    savePermutations() {

        let permutations = getPermutations(true);
        
        if (permutations.length == 0) {
            showOverlayError('No permutations to save');
            return;
        }

        let ajaxData = {};
        ajaxData[keyPermutations] = permutations;
        ajaxData[keyForm] = convertForm2JSON(elForm);
        ajaxData.csrf_token = ajaxData[keyForm].csrf_token;
        ajaxData.comment = document.querySelector(idTextareaConfirm).value;

        console.log('ajaxData:'); console.log(ajaxData);
        ajaxJSONData('permutations', mapHashToController(hashPageStorePermutationsPost), ajaxData, callbackLoadPermutations, false, {});
    }

    getPermutations(dirtyOnly) {
        let table = document.querySelectorAll(idTableMain);
        let permutations = [];
        let row, permutation, ddlCategory, ddlProduct, variations, quantityStock, quantityMin, quantityMax, costLocal;
        table.querySelector('tbody tr').each(function(index, row) {
            row = document.querySelectorAll(row);
            if (dirtyOnly && !row.classList.contains(flagDirty)) return;

            ddlCategory = row.querySelector('td.' + flagCategory + ' select');
            ddlProduct = row.querySelector('td.' + flagProduct + ' select');
            variations = row.querySelector('td.' + flagVariations + ' textarea');
            quantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
            quantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
            quantityMax = row.querySelector('td.' + flagQuantityMax + ' input');

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

    hookupTableMain() {
        let table = document.querySelectorAll(idTableMain);
        let rowBlankTemp = table.querySelector('tr.' + flagRowNew);
        console.log("row blank temp: ", rowBlankTemp);
        _rowBlank = rowBlankTemp[0].cloneNode(true);
        table.querySelector('tr.' + flagRowNew).remove();

        /*
        let ddlCategory, ddlProduct;
        let optionsCategory = document.querySelectorAll(idFilterCategory + ' option');
        optionsCategory.

        console.log('optionsCategory:', optionsCategory);

        table.querySelector('tbody tr').each(function(index, row) {
            console.log("hooking up row ", index);
            row = document.querySelectorAll(row);
            ddlCategory = row.querySelector('td.' + flagCategory + ' select');
            ddlProduct = row.querySelector('td.' + flagProduct + ' select');
            
            optionsCategory.clone().appendTo(ddlCategory);

            /*
            listProducts.forEach(function(product) {
                if (product[attrIdCategory] != getElementCurrentValue(ddlCategory)) return;
                ddlProduct.appendChild(document.createElement('<option>', product));
            });
            *
        });
        */

        let ddlCategory, ddlProduct, variations, quantityStock, quantityMin, quantityMax, costLocal;
        table.querySelector('tbody tr').each(function(index, row) {
            console.log("hooking up row ", index);
            row = document.querySelectorAll(row);
            ddlCategory = row.querySelector('td.' + flagCategory + ' select');
            ddlProduct = row.querySelector('td.' + flagProduct + ' select');
            variations = row.querySelector('td.' + flagVariations + ' textarea');
            quantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
            quantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
            quantityMax = row.querySelector('td.' + flagQuantityMax + ' input');
            
            initialiseEventHandler(ddlCategory, flagInitialised, function() {
                // ddlCategory = document.querySelectorAll(ddlCategory);
                ddlCategory.addEventListener('change', function() {
                    /*
                    ddlCategory.attr(attrValuePrevious, ddlCategory.attr(attrValueCurrent));
                    ddlCategory.attr(attrValueCurrent, ddlCategory.val());
                    */
                    handleChangeInputPermutations(this);
                    ddlCategory = this;
                    row = getRowFromElement(ddlCategory);
                    ddlProduct = row.querySelector('td.' + flagProduct + ' select');
                    // ddlProduct = document.querySelectorAll(ddlProduct);
                    ddlProduct.querySelector('option').remove();
                    ddlProduct.appendChild(document.createElement('<option>', {value: '', text: 'Select Product'}));
                    listProducts.forEach(function(product) {
                        if (product[attrIdCategory] != getElementCurrentValue(ddlCategory)) return;
                        ddlProduct.appendChild(document.createElement('<option>', product));
                    });
                    handleChangeInputPermutations(ddlProduct);
                });
            });

            initialiseEventHandler(ddlProduct, flagInitialised, function() {
                // ddlProduct = document.querySelectorAll(ddlProduct);
                ddlProduct.addEventListener('change', function() {
                    handleChangeInputPermutations(this);
                });
            });

            initialiseEventHandler(variations, flagInitialised, function() {
                // variations = document.querySelectorAll(variations);
                variations.addEventListener('change', function() {
                    handleChangeInputPermutations(this);
                });
            });

            initialiseEventHandler(quantityStock, flagInitialised, function() {
                // quantityStock = document.querySelectorAll(quantityStock);
                quantityStock.addEventListener('change', function() {
                    // console.log(this.value);
                    // quantityStock.value = this.value;
                    handleChangeInputPermutations(this);
                });
            });

            initialiseEventHandler(quantityMin, flagInitialised, function() {
                // quantityMin = document.querySelectorAll(quantityMin);
                quantityMin.addEventListener('change', function() {
                    handleChangeInputPermutations(this);
                });
            });

            initialiseEventHandler(quantityMax, flagInitialised, function() {
                // quantityMax = document.querySelectorAll(quantityMax);
                quantityMax.addEventListener('change', function() {
                    handleChangeInputPermutations(this);
                });
            });
        });
    }

    handleChangeInputPermutations(element) {
        console.log(element.value);
        let objJQuery = document.querySelectorAll(element);
        objJQuery.value = element.value;
        let row = getRowFromElement(objJQuery);
        let buttonCancel = document.querySelectorAll(idButtonCancel);
        let buttonSave = document.querySelectorAll(idButtonSave);
        let wasDirty = isElementDirty(objJQuery);

        if (objJQuery.classList.contains(flagVariations)) {
            objJQuery.attr(attrValueCurrent, getVariationsCurrentValue(objJQuery));
        } else {
            objJQuery.attr(attrValueCurrent, getElementCurrentValue(objJQuery));
        }
        let isDirty = isElementDirty(objJQuery);
        if (wasDirty != isDirty) {
            isRowDirty(row);
            let permutationsDirty = getPermutations(true);
            if (isEmpty(permutationsDirty)) {
                buttonCancel.classList.add(flagCollapsed);
                buttonSave.classList.add(flagCollapsed);
            } else {
                buttonCancel.classList.remove(flagCollapsed);
                buttonSave.classList.remove(flagCollapsed);
            }
        }
    }

    isRowDirty(row) {
        let ddlCategory = row.querySelector('td.' + flagCategory + ' select');
        let ddlProduct = row.querySelector('td.' + flagProduct + ' select');
        let variations = row.querySelector('td.' + flagVariations + ' textarea');
        let quantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
        let quantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
        let quantityMax = row.querySelector('td.' + flagQuantityMax + ' input');
        
        // return isElementDirty(ddlCategory) || isElementDirty(ddlProduct) || isElementDirty(variations) || isElementDirty(quantityStock) || isElementDirty(quantityMin) || isElementDirty(quantityMax);
        let isDirty = ddlCategory.classList.contains(flagDirty) || ddlProduct.classList.contains(flagDirty) || variations.classList.contains(flagDirty) || 
            quantityStock.classList.contains(flagDirty) || quantityMin.classList.contains(flagDirty) || quantityMax.classList.contains(flagDirty);
        if (isDirty) {
            row.classList.add(flagDirty);
        } else {
            row.classList.remove(flagDirty);
        }
        return isDirty;
    }

    getVariationsCurrentValue(element) {
        let value = element.value || null;
        let variations = value.split('\n');
        variations = variations.map(function(variation) {
            return variation.trim();
        });
        variations = variations.filter(function(variation) {
            return variation.length > 0;
        });
        return variations.join(',');
    }

    leave() {
        super.leave();
    }
}