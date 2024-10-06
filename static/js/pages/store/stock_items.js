

import Events from "../../lib/events.js";
import Validation from "../../lib/validation.js";
import BasePage from "../base.js";

export default class PageStoreStockItems extends BasePage {
    static hash = hashPageStoreStockItems;

    constructor(router) {
        super(router);
    }

    initialize() {
        this.sharedInitialize();
        this.hookupFilters();
        this.hookupButtonsSaveCancel();
        hookupTableMain();
        hookupOverlayConfirm(savePermutations);
    }

    hookupFilters() {
        let filterCategory = document.querySelectorAll(idFilterCategory);
        Events.initialiseEventHandler(filterCategory, flagInitialised, function() {
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
        Events.initialiseEventHandler(filterProduct, flagInitialised, function() {
            listProducts.forEach(function(product) {
                if (product[attrIdProductCategory] != DOM.getElementValueCurrent(document.querySelectorAll(idFilterCategory))) return;
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
        Events.initialiseEventHandler(filterIsOutOfStock, flagInitialised, function() {
            filterIsOutOfStock.addEventListener("change", function(event) {
                loadPermutations();
            });
        });

        let filterQuantityMin = document.querySelectorAll(idFilterQuantityMin);
        Events.initialiseEventHandler(filterQuantityMin, flagInitialised, function() {
            filterQuantityMin.addEventListener("change", function(event) {
                loadPermutations();
            });
        });
        
        let filterQuantityMax = document.querySelectorAll(idFilterQuantityMax);
        Events.initialiseEventHandler(filterQuantityMax, flagInitialised, function() {
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
        ajaxData[attrIdProductCategory] = DOM.getElementValueCurrent(document.querySelectorAll(idFilterCategory));
        ajaxData[attrIdProduct] = DOM.getElementValueCurrent(document.querySelectorAll(idFilterProduct));
        ajaxData[flagIsOutOfStock] = DOM.getElementValueCurrent(document.querySelectorAll(idFilterIsOutOfStock));
        ajaxData[flagQuantityMin] = DOM.getElementValueCurrent(document.querySelectorAll(idFilterQuantityMin));
        ajaxData[flagQuantityMax] = DOM.getElementValueCurrent(document.querySelectorAll(idFilterQuantityMax));
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
            dllCategory = row.querySelector('td.' + flagProductCategory + ' select');
            dllCategory.val(dataRow[attrIdProductCategory]);
            ddlProduct = row.querySelector('td.' + flagProduct + ' select');
            listProducts.forEach(function(product) {
                if (product[attrIdProductCategory] != dataRow[attrIdProductCategory]) return;
                ddlProduct.appendChild(document.createElement('<option>', product));
            });
            ddlProduct.val(dataRow[attrIdProduct]);
            row.querySelector('td.' + flagProductVariations + ' textarea').value = dataRow[flagProductVariations];
            row.querySelector('td.' + flagQuantityStock + ' input').value = dataRow[flagQuantityStock];
            row.querySelector('td.' + flagQuantityMin + ' input').value = dataRow[flagQuantityMin];
            row.querySelector('td.' + flagQuantityMax + ' input').value = dataRow[flagQuantityMax];
            row.querySelector('td.' + flagCostLocal).innerHTML = dataRow[flagCostLocal];
            row.setAttribute(attrIdProductCategory, dataRow[flagProductCategory]);
            row.setAttribute(attrIdProduct, dataRow[flagProduct]);
            row.setAttribute(attrIdPermutation, dataRow[attrIdPermutation]);
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

            ddlCategory = row.querySelector('td.' + flagProductCategory + ' select');
            ddlProduct = row.querySelector('td.' + flagProduct + ' select');
            variations = row.querySelector('td.' + flagProductVariations + ' textarea');
            quantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
            quantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
            quantityMax = row.querySelector('td.' + flagQuantityMax + ' input');

            permutation = {};
            permutation[attrIdProductCategory] = ddlCategory.getAttribute(attrValueCurrent);
            permutation[attrIdProduct] = ddlProduct.getAttribute(attrValueCurrent);
            permutation[attrIdPermutation] = row.getAttribute(attrIdPermutation)
            permutation[flagProductVariations] = variations.getAttribute(attrValueCurrent);
            permutation[flagQuantityStock] = quantityStock.getAttribute(attrValueCurrent);
            permutation[flagQuantityMin] = quantityMin.getAttribute(attrValueCurrent);
            permutation[flagQuantityMax] = quantityMax.getAttribute(attrValueCurrent);
            permutations.push(permutation);
        });
        return permutations;
    }

    hookupTableMain() {
        let table = document.querySelectorAll(idTableMain);
        let rowBlankTemp = table.querySelector('tr.' + flagRowNew);
        console.log("row blank temp: ", rowBlankTemp);
        _rowBlank = rowBlankTemp.cloneNode(true);
        table.querySelector('tr.' + flagRowNew).remove();

        /*
        let ddlCategory, ddlProduct;
        let optionsCategory = document.querySelectorAll(idFilterCategory + ' option');
        optionsCategory.

        console.log('optionsCategory:', optionsCategory);

        table.querySelector('tbody tr').each(function(index, row) {
            console.log("hooking up row ", index);
            row = document.querySelectorAll(row);
            ddlCategory = row.querySelector('td.' + flagProductCategory + ' select');
            ddlProduct = row.querySelector('td.' + flagProduct + ' select');
            
            optionsCategory.clone().appendTo(ddlCategory);

            /*
            listProducts.forEach(function(product) {
                if (product[attrIdProductCategory] != DOM.getElementValueCurrent(ddlCategory)) return;
                ddlProduct.appendChild(document.createElement('<option>', product));
            });
            *
        });
        */

        let ddlCategory, ddlProduct, variations, quantityStock, quantityMin, quantityMax, costLocal;
        table.querySelector('tbody tr').each(function(index, row) {
            console.log("hooking up row ", index);
            row = document.querySelectorAll(row);
            ddlCategory = row.querySelector('td.' + flagProductCategory + ' select');
            ddlProduct = row.querySelector('td.' + flagProduct + ' select');
            variations = row.querySelector('td.' + flagProductVariations + ' textarea');
            quantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
            quantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
            quantityMax = row.querySelector('td.' + flagQuantityMax + ' input');
            
            Events.initialiseEventHandler(ddlCategory, flagInitialised, function() {
                // ddlCategory = document.querySelectorAll(ddlCategory);
                ddlCategory.addEventListener('change', function() {
                    /*
                    ddlCategory.setAttribute(attrValuePrevious, ddlCategory.getAttribute(attrValueCurrent));
                    ddlCategory.setAttribute(attrValueCurrent, ddlCategory.val());
                    */
                    handleChangeInputPermutations(this);
                    ddlCategory = this;
                    row = getRowFromElement(ddlCategory);
                    ddlProduct = row.querySelector('td.' + flagProduct + ' select');
                    // ddlProduct = document.querySelectorAll(ddlProduct);
                    ddlProduct.querySelector('option').remove();
                    ddlProduct.appendChild(document.createElement('<option>', {value: '', text: 'Select Product'}));
                    listProducts.forEach(function(product) {
                        if (product[attrIdProductCategory] != DOM.getElementValueCurrent(ddlCategory)) return;
                        ddlProduct.appendChild(document.createElement('<option>', product));
                    });
                    handleChangeInputPermutations(ddlProduct);
                });
            });

            Events.initialiseEventHandler(ddlProduct, flagInitialised, function() {
                // ddlProduct = document.querySelectorAll(ddlProduct);
                ddlProduct.addEventListener('change', function() {
                    handleChangeInputPermutations(this);
                });
            });

            Events.initialiseEventHandler(variations, flagInitialised, function() {
                // variations = document.querySelectorAll(variations);
                variations.addEventListener('change', function() {
                    handleChangeInputPermutations(this);
                });
            });

            Events.initialiseEventHandler(quantityStock, flagInitialised, function() {
                // quantityStock = document.querySelectorAll(quantityStock);
                quantityStock.addEventListener('change', function() {
                    // console.log(this.value);
                    // quantityStock.value = this.value;
                    handleChangeInputPermutations(this);
                });
            });

            Events.initialiseEventHandler(quantityMin, flagInitialised, function() {
                // quantityMin = document.querySelectorAll(quantityMin);
                quantityMin.addEventListener('change', function() {
                    handleChangeInputPermutations(this);
                });
            });

            Events.initialiseEventHandler(quantityMax, flagInitialised, function() {
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
        let wasDirty = updateAndCheckIsElementDirty(objJQuery);

        if (objJQuery.classList.contains(flagProductVariations)) {
            objJQuery.setAttribute(attrValueCurrent, getVariationsCurrentValue(objJQuery));
        } else {
            objJQuery.setAttribute(attrValueCurrent, DOM.getElementValueCurrent(objJQuery));
        }
        let isDirty = updateAndCheckIsElementDirty(objJQuery);
        if (wasDirty != isDirty) {
            isRowDirty(row);
            let permutationsDirty = getPermutations(true);
            if (Validation.isEmpty(permutationsDirty)) {
                buttonCancel.classList.add(flagCollapsed);
                buttonSave.classList.add(flagCollapsed);
            } else {
                buttonCancel.classList.remove(flagCollapsed);
                buttonSave.classList.remove(flagCollapsed);
            }
        }
    }

    isRowDirty(row) {
        let ddlCategory = row.querySelector('td.' + flagProductCategory + ' select');
        let ddlProduct = row.querySelector('td.' + flagProduct + ' select');
        let variations = row.querySelector('td.' + flagProductVariations + ' textarea');
        let quantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
        let quantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
        let quantityMax = row.querySelector('td.' + flagQuantityMax + ' input');
        
        // return updateAndCheckIsElementDirty(ddlCategory) || updateAndCheckIsElementDirty(ddlProduct) || updateAndCheckIsElementDirty(variations) || updateAndCheckIsElementDirty(quantityStock) || updateAndCheckIsElementDirty(quantityMin) || updateAndCheckIsElementDirty(quantityMax);
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
}


import TableBasePage from "../base_table.js";
import API from "../../api.js";
import DOM from "../../dom.js";

export class PageStoreProductCategories extends TableBasePage {
    static hash = hashPageStoreProductCategories;
    callFilterTableContent = API.getCategoriesByFilters;

    constructor() {
        super();
    }

    initialize() {
        super.initialize();
    }

    hookupFilters() {
        super.hookupFilters();
        this.hookupFilterIsNotEmpty();
        this.hookupFilterActive();
    }
    hookupFilterIsNotEmpty() {
        Events.initialiseEventHandler('.' + flagIsNotEmpty, flagInitialised, (filter) => {
            filter.addEventListener("change", (event) => {
                PageStoreProductCategories.isDirtyFilter(filter);
            });
        });
    }

    loadRowTable(rowJson) {
        if (rowJson == null) return;
        let row = _rowBlank.cloneNode(true);
        row.classList.remove(flagRowNew);
        row.classList.remove(flagInitialised);
        row.querySelectorAll('.' + flagInitialised).forEach(function(element) {
            element.classList.remove(flagInitialised);
        });
        console.log("applying data row: ", rowJson);
        let sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
        let textareaCode = row.querySelector('td.' + flagCode + ' textarea');
        let textareaName = row.querySelector('td.' + flagName + ' textarea');
        let textareaDescription = row.querySelector('td.' + flagDescription + ' textarea');
        let tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
        let divAccessLevel = tdAccessLevel.querySelector('div.' + flagAccessLevel);
        let inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');

        sliderDisplayOrder.setAttribute(attrValueCurrent, rowJson[flagDisplayOrder]);
        DOM.setElementAttributeValuePrevious(sliderDisplayOrder, rowJson[flagDisplayOrder]);
        DOM.setElementValueCurrent(textareaCode, rowJson[flagCode]);
        DOM.setElementAttributeValuePrevious(textareaCode, rowJson[flagCode]);
        DOM.setElementValueCurrent(textareaName, rowJson[flagName]);
        DOM.setElementAttributeValuePrevious(textareaName, rowJson[flagName]);
        DOM.setElementValueCurrent(textareaDescription, rowJson[flagDescription]);
        DOM.setElementAttributeValuePrevious(textareaDescription, rowJson[flagDescription]);
        tdAccessLevel.setAttribute(attrIdAccessLevel, rowJson[attrIdAccessLevel]);
        tdAccessLevel.setAttribute(flagAccessLevelRequired, rowJson[flagAccessLevelRequired]);
        divAccessLevel.setAttribute(attrIdAccessLevel, rowJson[attrIdAccessLevel]);
        DOM.setElementValueCurrent(divAccessLevel, rowJson[attrIdAccessLevel]);
        DOM.setElementAttributeValuePrevious(divAccessLevel, rowJson[attrIdAccessLevel]);
        divAccessLevel.textContent = rowJson[flagAccessLevelRequired];
        DOM.setElementValueCurrent(inputActive, rowJson[flagActive]);
        DOM.setElementAttributeValuePrevious(inputActive, rowJson[flagActive]);
        row.setAttribute(rowJson[flagKeyPrimary], rowJson[rowJson[flagKeyPrimary]]);
        
        let table = this.getTableMain();
        let bodyTable = table.querySelector('tbody');
        bodyTable.appendChild(row);
    }
    getJsonRow(row) {
        if (row == null) return;
        let sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
        let textareaCode = row.querySelector('td.' + flagCode + ' textarea');
        let textareaName = row.querySelector('td.' + flagName + ' textarea');
        let textareaDescription = row.querySelector('td.' + flagDescription + ' textarea');
        let tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
        let inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');

        let jsonCategory = {};
        jsonCategory[attrIdProductCategory] = row.getAttribute(attrIdProductCategory);
        jsonCategory[flagCode] = DOM.getElementValueCurrent(textareaCode);
        jsonCategory[flagName] = DOM.getElementValueCurrent(textareaName);
        jsonCategory[flagDescription] = DOM.getElementValueCurrent(textareaDescription);
        jsonCategory[flagAccessLevelRequired] = tdAccessLevel.getAttribute(flagAccessLevelRequired);
        jsonCategory[attrIdAccessLevel] = tdAccessLevel.getAttribute(attrIdAccessLevel);
        jsonCategory[flagActive] = DOM.getElementValueCurrent(inputActive);
        jsonCategory[flagDisplayOrder] = sliderDisplayOrder.getAttribute(attrValueCurrent);
        return jsonCategory;
    }

    hookupTableMain() {
        super.hookupTableMain();
        this.hookupSlidersDisplayOrderTable();
        this.hookupTextareasCodeTable();
        this.hookupTextareasNameTable();
        this.hookupTextareasDescriptionTable();
        this.hookupTdsAccessLevel();
        this.hookupInputsActiveTable();
    }

    isRowDirty(row) {
        if (row == null) return;
        let ddlCategory = row.querySelector('td.' + flagProductCategory + ' select');
        let ddlProduct = row.querySelector('td.' + flagProduct + ' select');
        let variations = row.querySelector('td.' + flagProductVariations + ' textarea');
        let quantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
        let quantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
        let quantityMax = row.querySelector('td.' + flagQuantityMax + ' input');
        
        // return updateAndCheckIsElementDirty(ddlCategory) || updateAndCheckIsElementDirty(ddlProduct) || updateAndCheckIsElementDirty(variations) || updateAndCheckIsElementDirty(quantityStock) || updateAndCheckIsElementDirty(quantityMin) || updateAndCheckIsElementDirty(quantityMax);
        let isDirty = ddlCategory.classList.contains(flagDirty) || ddlProduct.classList.contains(flagDirty) || variations.classList.contains(flagDirty) || 
            quantityStock.classList.contains(flagDirty) || quantityMin.classList.contains(flagDirty) || quantityMax.classList.contains(flagDirty);
        if (isDirty) {
            row.classList.add(flagDirty);
        } else {
            row.classList.remove(flagDirty);
        }
        return isDirty;
    }


    leave() {
        super.leave();
    }

    getFiltersDefaults() {
        filters = {};
        filters.flagIsNotEmpty = true;
        filters.flagActive = true;
        return filters;
    }
}

