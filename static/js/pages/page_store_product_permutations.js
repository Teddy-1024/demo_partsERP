var _rowBlank = null;

import { PageBase } from "./page_base.js";

export class PageStoreProductPermutations extends PageBase {
    static hash = hashPageStoreProductPermutations;

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
        initialiseEventHandler(idFilterCategory, flagInitialised, function(filterCategory) {
            console.log("hooking up filter category");
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

        initialiseEventHandler(idFilterProduct, flagInitialised, function(filterProduct) {
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
        
        initialiseEventHandler(idFilterIsOutOfStock, flagInitialised, function(filterIsOutOfStock) {
            filterIsOutOfStock.addEventListener("change", function(event) {
                loadPermutations();
            });
        });

        initialiseEventHandler(idFilterQuantityMin, flagInitialised, function(filterQuantityMin) {
            filterQuantityMin.addEventListener("change", function(event) {
                loadPermutations();
            });
        });
        
        initialiseEventHandler(idFilterQuantityMax, flagInitialised, function(filterQuantityMax) {
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

        response.data.forEach(function(dataRow) {
            row = _rowBlank.cloneNode(true);
            row = document.querySelectorAll(row);
            row.classList.remove(flagRowNew);
            console.log("applying data row: ", dataRow);
            dllCategory = row.querySelector('td.' + flagCategory + ' select');
            dllCategory.value = dataRow[attrIdCategory];
            ddlProduct = row.querySelector('td.' + flagProduct + ' select');
            listProducts.forEach(function(product) {
                if (product[attrIdCategory] != dataRow[attrIdCategory]) return;
                ddlProduct.appendChild(document.createElement('<option>', product));
            });
            ddlProduct.value = dataRow[attrIdProduct];
            row.querySelector('td.' + flagVariations + ' textarea').value = dataRow[flagVariations];
            row.querySelector('td.' + flagQuantityStock + ' input').value = dataRow[flagQuantityStock];
            row.querySelector('td.' + flagQuantityMin + ' input').value = dataRow[flagQuantityMin];
            row.querySelector('td.' + flagQuantityMax + ' input').value = dataRow[flagQuantityMax];
            row.querySelector('td.' + flagCostLocalVATIncl).innerHTML = dataRow[flagCostLocalVATIncl];
            row.attr(attrIdCategory, dataRow[flagCategory]);
            row.attr(attrIdProduct, dataRow[flagProduct]);
            row.attr(attrIdPermutation, dataRow[attrIdPermutation]);
            bodyTable.appendChild(row);
        });
    }

    hookupButtonsSaveCancel() {
        initialiseEventHandler(idButtonSave, flagInitialised, function(button) {
            button.addEventListener("click", function(event) {
                event.stopPropagation();
                showOverlayConfirm();
            });
        });
        // let parentSave = btnSave.closest('div.' + flagColumn);
        // parentSave.classList.add(flagCollapsed);

        initialiseEventHandler(idButtonCancel, flagInitialised, function(button) {
            button.addEventListener("click", function(event) {
                event.stopPropagation();
                loadPermutations();
            });
        });
        // let parentCancel = btnCancel.closest('div.' + flagColumn);
        // parentCancel.classList.add(flagCollapsed);

        initialiseEventHandler(idButtonCancel, flagInitialised, function(button) {
            button.addEventListener("click", function(event) {
                event.stopPropagation();
                let table = document.querySelectorAll(idTableMain);
                let row = _rowBlank.cloneNode(true);
                row = document.querySelectorAll(row);
                row.classList.remove(flagRowNew);
                let ddlCategory = row.querySelector('td.' + flagCategory + ' select');
                let idCategory = getElementCurrentValue(document.querySelectorAll(idFilterCategory));
                idCategory = (idCategory == 0) ? idCategoryDefault : idCategory;
                let ddlProduct = row.querySelector('td.' + flagProduct + ' select');
                let products = productsByCategory[idCategory];
                products.forEach(function(product) {
                    ddlProduct.appendChild(document.createElement('<option>', product));
                });
                table.querySelector('tbody').appendChild(row);
            });
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
        ajaxData.comment = document.querySelectorAll(idTextareaConfirm).value;

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
        initialiseEventHandler(idTableMain, flagInitialised, function(table) {

            table.querySelectorAll('td.' + flagCategory + ' select').addEventListener("change", function(event) {
                handleChangeInputPermutations(this);
                ddlCategory = this;
                row = getRowFromElement(ddlCategory);
                ddlProduct = row.querySelector('td.' + flagProduct + ' select');
                ddlProduct.querySelector('option').remove();
                ddlProduct.appendChild(document.createElement('<option>', {value: '', text: 'Select Product'}));
                listProducts.forEach(function(product) {
                    if (product[attrIdCategory] != getElementCurrentValue(ddlCategory)) return;
                    ddlProduct.appendChild(document.createElement('<option>', product));
                });
                handleChangeInputPermutations(ddlProduct);
            });

            table.querySelectorAll("change", 'td.' + flagProduct + ' select' + ',' + 'td.' + flagQuantityStock + ' input' + ',' + 'td.' + flagQuantityMin + ' input' + ',' + 'td.' + flagQuantityMax + ' input').addEventListener("change", function(event) {
                handleChangeInputPermutations(this);
            });

            table.querySelectorAll("click", 'td.' + flagVariations + ' textarea').addEventListener("change", function(event) {
                event.stopPropagation();
                handleClickPermutationsInputVariations(this);
            });

            table.querySelectorAll("click", 'td.' + flagDetail + ' button').addEventListener("change", function(event) {
                event.stopPropagation();
                console.log("not implemented error: detail clicked");
            });

            table.querySelectorAll("click", 'td.' + flagVariations + ' button.' + flagAdd).addEventListener("change", function(event) {
                event.stopPropagation();
                handleClickPermutationsVariationsButtonAdd(this);
            });
        });

        // cache new row for cloning
        let rowBlankTemp = table.querySelector('tr.' + flagRowNew);
        console.log("row blank temp: ", rowBlankTemp);
        _rowBlank = rowBlankTemp.cloneNode(true);
        table.querySelectorAll('tr.' + flagRowNew).forEach(function(row) {
            row.remove();
        });
    }

    handleChangeInputPermutations(element) {
        console.log("handleChangeInputPermutations");
        console.log("element value:", element.value);
        let row = getRowFromElement(element);
        let formFilters = document.querySelector(idFormFiltersPermutations);
        let buttonCancel = formFilters.querySelector(idButtonCancel);
        let buttonSave = formFilters.querySelector(idButtonSave);
        let wasDirty = isElementDirty(element);

        if (objJQuery.classList.contains(flagVariations)) {
            element.setAttribute(attrValueCurrent, getProductVariationsText(element));
        } else {
            element.setAttribute(attrValueCurrent, getElementCurrentValue(element));
        }
        let isDirty = isElementDirty(element);

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

    isElementDirty(element) {
        let isDirty = element.attr(attrValuePrevious) != element.attr(attrValueCurrent);
        let cell = getCellFromElement(element);
        if (isDirty) {
            element.classList.add(flagDirty);
            cell.classList.add(flagDirty);
        } else {
            element.classList.remove(flagDirty);
            cell.classList.remove(flagDirty);
        }
        return isDirty;
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

    getProductVariationsText(element) {
        element = document.querySelectorAll(element);
        /*
        let value = element.value;
        let variations = value.split('\n');
        variations = variations.map(function(variation) {
            return variation.trim();
        });
        variations = variations.filter(function(variation) {
            return variation.length > 0;
        });
        */
        let variations = dictVariations[element.attr(attrIdVariation)].map((variation, index) => {
            return variation[keyNameVariationType] + ': ' + variation[keyNameVariation];
        });
        return variations.join(',\n');
    }

    getElementProductVariations(element) {
        element = document.querySelectorAll(element);
        let variations = element.attr(attrValueCurrent);
        let objVariations = [];
        if (!isEmpty(variations)) {
            variations = variations.split(',');
            variations.forEach((variation) => {
                let parts = variation.split(':');
                if (parts.length == 2) {
                    objVariations.push({
                        [attrIdVariationType]: parts[0].trim(),
                        [attrIdVariation]: parts[1].trim(),
                    });
                }
            });
        }
        return objVariations;
    }

    handleClickPermutationsInputVariations(element) {
        element = document.querySelectorAll(element);
        
        let jsonVariation, jsonVariationType, tr, tdVariationType, variationType, attributesVariationType, tdNameVariation, nameVariation, attributesNameVariation, tdDelete, buttonDelete, tmpJsonVariation, tmpJsonVariationType;
        let variations = getElementProductVariations(element);
        let tblVariations = document.createElement("<table>");
        let thead = document.createElement("<thead>");
        tr = document.createElement("<tr>");
        let thVariationType = document.createElement("<th>", {
            text: 'Type',
        });
        let thNameVariation = document.createElement("<th>", {
            text: 'Name',
        });
        let buttonAdd = document.createElement("<button>", {
            class: flagAdd,
            text: '+',
        });
        let thAddDelete = document.createElement("<th>");
        thAddDelete.appendChild(buttonAdd);
        tr.appendChild(thVariationType);
        tr.appendChild(thNameVariation);
        tr.appendChild(thAddDelete);
        thead.appendChild(tr);
        tblVariations.appendChild(thead);

        let tbody = document.createElement("<tbody>");
        console.log('variations:', variations);
        /*
        if (isEmpty(variations)) {
            return;
        }
        */
        variations.forEach((variation, index) => {
            jsonVariationType = dictVariations[variation[attrIdVariationType]];
            jsonVariation = dictVariations[variation[attrIdVariation]];
            tdVariationType = document.createElement("<td>", {
                class: attrIdVariationType,
            });
            attributesVariationType = {
                class: attrIdVariationType,
                value: variation[attrIdVariationType],
            };
            attributesVariationType[attrValueCurrent] = jsonVariation[attrIdVariationType];
            attributesVariationType[attrValuePrevious] = jsonVariation[attrIdVariationType];
            variationType = document.createElement("<select>", attributesVariationType);
            listVariationTypes.forEach((idVariationType) => {
                tmpJsonVariationType = dictVariationTypes[idVariationType];
                variationType.appendChild(document.createElement('<option>', { 
                    value: jsonVariationType[attrIdVariationType],
                    text: jsonVariationType[keyNameVariationType],
                    selected: (idVariationType == jsonVariationType[attrIdVariationType]),
                }));
            });
            tdNameVariation = document.createElement("<td>", {
                class: attrIdVariation,
            });
            attributesNameVariation = {
                class: attrIdVariation,
                value: variation[attrIdVariation],
            };
            attributesNameVariation[attrValueCurrent] = jsonVariation[attrIdVariation];
            attributesNameVariation[attrValuePrevious] = jsonVariation[attrIdVariation];
            nameVariation = document.createElement("<select>", attributesNameVariation);
            listVariations.forEach((idVariation) => {
                tmpJsonVariation = dictVariations[idVariation];
                console.log("id_variation: ", idVariation);
                console.log("tmpJsonVariation: ", tmpJsonVariation);
                nameVariation.appendChild(document.createElement('<option>', {
                    value: tmpJsonVariation[attrIdVariation],
                    text: tmpJsonVariation[keyNameVariation],
                    selected: (idVariation == jsonVariation[attrIdVariation]),
                }));
            });
            tdDelete = document.createElement("<td>", {
                class: flagDelete,
            });
            buttonDelete = document.createElement("<button>", {
                class: flagDelete,
                text: 'x',
            });
            tr = document.createElement("<tr>");
            tdVariationType.appendChild(variationType);
            tr.appendChild(tdVariationType);
            tdNameVariation.appendChild(nameVariation);
            tr.appendChild(tdNameVariation);
            tdDelete.appendChild(buttonDelete);
            tr.appendChild(tdDelete);
            tbody.appendChild(tr);
        });
        
        tblVariations.appendChild(tbody);
        let parent = element.parentElement;
        parent.innerHTML = '';
        parent.appendChild(tblVariations);
        console.log("tblVariations: ", tblVariations);
    }

    handleClickPermutationsVariationsButtonAdd(element) {
        element = document.querySelectorAll(element);
        let row = getRowFromElement(element);
        let variations = row.querySelector('td.' + flagVariations + ' textarea');
        let value = variations.value;
        value = (isEmpty(value)) ? '' : value + '\n';
        value += 'Type: Variation\n';
        variations.value = value;
        handleChangeInputPermutations(variations);
        console.log("error: not implemented");
    }

    leave() {
        super.leave();
    }
}

