
import API from "../../api.js";
import BusinessObjects from "../../lib/business_objects.js";
import DOM from "../../dom.js";
import Events from "../../lib/events.js";
import TableBasePage from "../base_table.js";
import Utils from "../../lib/utils.js";
import Validation from "../../lib/validation.js";
import StoreTableMixinPage from "./mixin_table.js";

export default class PageStoreProductPermutations extends TableBasePage {
    static hash = hashPageStoreProductPermutations;
    callFilterTableContent = API.getProductPermutationsByFilters;
    callSaveTableContent = API.saveProductPermutations;

    constructor(router) {
        super(router);
        this.storeMixin = new StoreTableMixinPage(this);
    }

    initialize() {
        this.sharedInitialize();
    }

    hookupFilters() {
        this.sharedHookupFilters();
        this.hookupFilterProductCategory();
        this.hookupFilterProduct();
        this.hookupFilterOutOfStock();
        this.hookupFilterMinStock();
        this.hookupFilterMaxStock();
    }
    hookupFilterProductCategory() {
        this.hookupFilter(flagProductCategory, (event, filterCategory) => {
            // loadPermutations();
            // let wasDirtyFilter = filterCategory.classList.contains(flagDirty);
            PageStoreProductPermutations.isDirtyFilter(filterCategory);
            let isDirtyFilter = filterCategory.classList.contains(flagDirty);
            let idProductCategory = DOM.getElementValueCurrent(filterCategory);
            let products = productCategories[idProductCategory];
            let filterProduct = document.querySelector(idFormFilters + ' .' + flagProduct);
            let idProductPrevious = filterProduct.getAttribute(attrValuePrevious);
            filterProduct.innerHTML = '';
            let optionJson, option;
            option = DOM.createOption(null);
            filterProduct.appendChild(option);
            products.forEach((product) => {
                optionJson = BusinessObjects.getOptionJsonFromObjectJson(product, idProductPrevious);
                option = DOM.createOption(optionJson);
                filterProduct.appendChild(option);
            });
            filterProduct.dispatchEvent(new Event('change'));
        });
    }
    hookupFilterProduct() {
        this.hookupFilter(flagProduct);
    }
    hookupFilterOutOfStock() {
        this.hookupFilter(flagIsOutOfStock);
    }
    hookupFilterMinStock() {
        this.hookupFilter(flagQuantityMin);
    }
    hookupFilterMaxStock() {
        this.hookupFilter(flagQuantityMax);
    }

    loadRowTable(rowJson) {
        /*
        if (rowJson == null) return;
        let tableMain = this.getTableMain();
        let row = _rowBlank.cloneNode(true);
        row.classList.remove(flagRowNew);
        console.log("applying data row: ", rowJson);
        let dllCategory = row.querySelector('td.' + flagProductCategory + ' select');
        dllCategory.value = rowJson[attrIdProductCategory];
        let ddlProduct = row.querySelector('td.' + flagProduct + ' select');
        let optionJson, option;
        listProducts.forEach(function(product) {
            if (product[attrIdProductCategory] != rowJson[attrIdProductCategory]) return;
            optionJson = BusinessObjects.getOptionJsonFromObjectJson(product);
            option = DOM.createOption(optionJson, rowJson[attrIdProduct]);
            ddlProduct.appendChild(option);
        });
        ddlProduct.value = rowJson[attrIdProduct];
        row.querySelector('td.' + flagProductVariations + ' textarea').value = rowJson[flagProductVariations];
        let tdProductVariations = row.querySelector('td.' + flagProductVariations);
        let textareaProductVariations = tdProductVariations.querySelector('textarea');
        DOM.setElementValuesCurrentAndPrevious(textareaProductVariations, rowJson[flagProductVariations]);
        let thProductVariations = row.querySelector('td.' + flagProductVariations);
        if (!thProductVariations.classList.contains(flagCollapsed)) tdProductVariations.classList.remove(flagCollapsed);
        let inputDescription = row.querySelector('td.' + flagDescription + ' textarea');
        DOM.setElementValuesCurrentAndPrevious(inputDescription, rowJson[flagDescription]);
        let inputCostLocal = row.querySelector('td.' + flagCostLocal + ' input');
        DOM.setElementValuesCurrentAndPrevious(inputCostLocal, rowJson[flagCostLocal]);
        let tdCurrencyCost = row.querySelector('td.' + flagCurrencyCost);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdCurrencyCost, rowJson[flagCurrencyCost]);
        let ddlCurrencyCost = tdCurrencyCost.querySelector('select');
        DOM.setElementValuesCurrentAndPrevious(ddlCurrencyCost, rowJson[flagCurrencyCost]);
        let inputProfitLocalMin = row.querySelector('td.' + flagProfitLocalMin + ' input');
        DOM.setElementValuesCurrentAndPrevious(inputProfitLocalMin, rowJson[flagProfitLocalMin]);
        let inputLatencyManufactureDays = row.querySelector('td.' + flagLatencyManufactureDays + ' input');
        DOM.setElementValuesCurrentAndPrevious(inputLatencyManufactureDays, rowJson[flagLatencyManufactureDays]);
        let inputQuantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
        DOM.setElementValuesCurrentAndPrevious(inputQuantityStock, rowJson[flagQuantityStock]);
        let inputQuantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
        DOM.setElementValuesCurrentAndPrevious(inputQuantityMin, rowJson[flagQuantityMin]);
        let inputQuantityMax = row.querySelector('td.' + flagQuantityMax + ' input');
        DOM.setElementValuesCurrentAndPrevious(inputQuantityMax, rowJson[flagQuantityMax]);
        let inputQuantityStep = row.querySelector('td.' + flagCountUnitMeasurementPerQuantityStep + ' input');
        DOM.setElementValuesCurrentAndPrevious(inputQuantityStep, rowJson[flagCountUnitMeasurementPerQuantityStep]);



        row.querySelector('td.' + flagQuantityStock + ' input').value = rowJson[flagQuantityStock];
        row.querySelector('td.' + flagQuantityMin + ' input').value = rowJson[flagQuantityMin];
        row.querySelector('td.' + flagQuantityMax + ' input').value = rowJson[flagQuantityMax];
        row.querySelector('td.' + flagCostLocal).innerHTML = rowJson[flagCostLocal];
        row.setAttribute(attrIdProductCategory, rowJson[flagProductCategory]);
        row.setAttribute(attrIdProduct, rowJson[flagProduct]);
        row.setAttribute(attrIdProductPermutation, rowJson[attrIdProductPermutation]);
        let tbody = tableMain.querySelector('tbody');
        tbody.appendChild(row);
        */
    }
    getJsonRow(row) {
        if (row == null) return;
        let tdProductCategory = row.querySelector('td.' + flagProductCategory);
        let tdProduct = row.querySelector('td.' + flagProduct);
        let tdProductVariations = row.querySelector('td.' + flagProductVariations);
        let inputDescription = row.querySelector('td.' + flagDescription + ' textarea');
        let inputCostLocal = row.querySelector('td.' + flagCostLocal + ' input');
        let tdCurrencyCost = row.querySelector('td.' + flagCurrencyCost);
        let inputProfitLocalMin = row.querySelector('td.' + flagProfitLocalMin + ' input');
        let inputLatencyManufactureDays = row.querySelector('td.' + flagLatencyManufactureDays + ' input');
        let inputQuantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
        let inputQuantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
        let inputQuantityMax = row.querySelector('td.' + flagQuantityMax + ' input');
        let inputQuantityStep = row.querySelector('td.' + flagCountUnitMeasurementPerQuantityStep + ' input');
        let tdUnitMeasurementQuantity = row.querySelector('td.' + flagUnitMeasurementQuantity);
        let checkboxIsSubscription = row.querySelector('td.' + flagIsSubscription + ' input');
        let inputCountIntervalRecurrence = row.querySelector('td.' + flagCountUnitMeasurementIntervalRecurrence + ' input');
        let tdUnitMeasurementIntervalRecurrence = row.querySelector('td.' + flagUnitMeasurementIntervalRecurrence);
        let inputIdStripeProduct = row.querySelector('td.' + flagIdStripeProduct + ' input');
        let checkboxDoesExpireFasterOnceUnsealed = row.querySelector('td.' + flagDoesExpireFasterOnceUnsealed + ' input');
        let inputCountIntervalExpirationUnsealed = row.querySelector('td.' + flagCountUnitMeasurementIntervalExpirationUnsealed + ' input');
        let tdUnitMeasurementIntervalExpirationUnsealed = row.querySelector('td.' + flagUnitMeasurementIntervalExpirationUnsealed);
        let checkboxActive = row.querySelector('td.' + flagActive + ' input');

        let jsonRow = {};
        jsonRow[attrIdProductPermutation] = row.getAttribute(attrIdProductPermutation);
        jsonRow[attrIdProductCategory] = tdProductCategory.getAttribute(attrValueCurrent);
        jsonRow[attrIdProduct] = tdProduct.getAttribute(attrValueCurrent);
        jsonRow[flagProductVariations] = tdProductVariations.getAttribute(attrValueCurrent);
        jsonRow[flagHasVariations] = jsonRow[flagProductVariations] != '';
        jsonRow[flagDescription] = inputDescription.getAttribute(attrValueCurrent);
        jsonRow[flagCostLocal] = inputCostLocal.getAttribute(attrValueCurrent);
        jsonRow[flagCurrencyCost] = tdCurrencyCost.getAttribute(attrValueCurrent);
        jsonRow[flagProfitLocalMin] = inputProfitLocalMin.getAttribute(attrValueCurrent);
        jsonRow[flagLatencyManufactureDays] = inputLatencyManufactureDays.getAttribute(attrValueCurrent);
        jsonRow[flagQuantityStock] = inputQuantityStock.getAttribute(attrValueCurrent);
        jsonRow[flagQuantityMin] = inputQuantityMin.getAttribute(attrValueCurrent);
        jsonRow[flagQuantityMax] = inputQuantityMax.getAttribute(attrValueCurrent);
        jsonRow[flagCountUnitMeasurementPerQuantityStep] = inputQuantityStep.getAttribute(attrValueCurrent);
        jsonRow[flagUnitMeasurementQuantity] = tdUnitMeasurementQuantity.getAttribute(attrValueCurrent);
        jsonRow[flagIsSubscription] = checkboxIsSubscription.getAttribute(attrValueCurrent);
        jsonRow[flagCountUnitMeasurementIntervalRecurrence] = inputCountIntervalRecurrence.getAttribute(attrValueCurrent);
        jsonRow[flagUnitMeasurementIntervalRecurrence] = tdUnitMeasurementIntervalRecurrence.getAttribute(attrValueCurrent);
        jsonRow[flagIdStripeProduct] = inputIdStripeProduct.getAttribute(attrValueCurrent);
        jsonRow[flagDoesExpireFasterOnceUnsealed] = checkboxDoesExpireFasterOnceUnsealed.getAttribute(attrValueCurrent);
        jsonRow[flagCountUnitMeasurementIntervalExpirationUnsealed] = inputCountIntervalExpirationUnsealed.getAttribute(attrValueCurrent);
        jsonRow[flagUnitMeasurementIntervalExpirationUnsealed] = tdUnitMeasurementIntervalExpirationUnsealed.getAttribute(attrValueCurrent);
        jsonRow[flagActive] = checkboxActive.getAttribute(attrValueCurrent);
        return jsonRow;
    }
    initialiseRowNew(row) {
        let ddlCategoryFilter = document.querySelector(idFormFilters + ' #' + attrIdProductCategory);
        let idProductCategoryFilter = DOM.getElementValueCurrent(ddlCategoryFilter);
        let hasCategoryFilter = !(Validation.isEmpty(idProductCategoryFilter) || idProductCategoryFilter == '0');
        let ddlProductFilter = document.querySelector(idFormFilters + ' #' + attrIdProduct);
        let idProductFilter = DOM.getElementValueCurrent(ddlProductFilter);
        let hasProductFilter = !(Validation.isEmpty(idProductFilter) || idProductFilter == '0');
        console.log("initialiseRowNew: ", row);
        console.log({ddlCategoryFilter, idProductCategoryFilter, hasCategoryFilter, ddlProductFilter, idProductFilter, hasProductFilter});
        if (!hasCategoryFilter && !hasProductFilter) return;
        if (hasCategoryFilter) {
            let ddlCategory = row.querySelector('td.' + flagProductCategory + ' select');
            DOM.setElementValuesCurrentAndPrevious(ddlCategory, idProductCategoryFilter);
            this.handleChangeProductCategoryDdl(null, ddlCategory);
        }
        if (hasProductFilter) {
            let ddlProduct = row.querySelector('td.' + flagProduct + ' select');
            DOM.setElementValuesCurrentAndPrevious(ddlProduct, idProductFilter);
        }
    }

    hookupTableMain() {
        super.hookupTableMain();
        this.hookupProductCategoryFields();
        this.hookupProductFields();
        this.hookupProductVariationFields();
        this.hookupDescriptionTextareas();
        this.hookupCostFields();
        this.hookupLatencyManufactureInputs();
        this.hookupQuantityFields();
        this.hookupSubscriptionFields();
        this.hookupIdStripeProductInputs();
        this.hookupExpirationFields();
        this.hookupActiveCheckboxes();
    }
    hookupProductCategoryFields() {
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagProductCategory, Utils.getListFromDict(productCategories), (event, element) => { this.hookupProductCategoryDdls(event, element); });
    }
    hookupProductCategoryDdls(ddlSelector) {
        this.hookupChangeHandlerTableCells(ddlSelector, (event, element) => { this.handleChangeProductCategoryDdl(event, element); });
    }
    handleChangeProductCategoryDdl(event, ddlCategory) {
        this.handleChangeTableCellDdl(event, ddlCategory);
        let idProductCategorySelected = DOM.getElementValueCurrent(ddlCategory);
        let row = DOM.getRowFromElement(ddlCategory);
        let tdProduct = row.querySelector('td.' + flagProduct);
        tdProduct.dispatchEvent(new Event('click'));
        let ddlProduct = row.querySelector('td.' + flagProduct + ' select');
        ddlProduct.innerHTML = '';
        ddlProduct.appendChild(DOM.createOption(null));
        let optionJson, option;
        Utils.getListFromDict(products).forEach((product) => {
            if (product[attrIdProductCategory] != idProductCategorySelected) return;
            optionJson = BusinessObjects.getOptionJsonFromObjectJson(product);
            option = DOM.createOption(optionJson);
            ddlProduct.appendChild(option);
        });
        this.handleChangeTableCellDdl(event, ddlProduct);
    }
    hookupProductFields() {
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagProduct, Utils.getListFromDict(products));
    }
    hookupProductVariationFields() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagProductVariations + '  div', (event, element) => this.handleClickProductPermutationVariationsPreview(event, element));
    }
    handleClickProductPermutationVariationsPreview(event, element) {
        this.toggleProductPermutationVariationsColumnCollapsed(false);
        let permutationVariations = this.getElementProductVariations(element);
        let tblVariations = document.createElement("table");
        tblVariations.classList.add(flagProductVariations);
        let thead = document.createElement("thead");
        let tr = document.createElement("tr");
        let thVariationType = document.createElement("th");
        thVariationType.textContent = 'Type';
        let thNameVariation = document.createElement("th");
        thNameVariation.textContent = 'Name';
        let buttonAdd = document.createElement("button");
        buttonAdd.classList.add(flagAdd);
        buttonAdd.textContent = '+';
        let thAddDelete = document.createElement("th");
        thAddDelete.appendChild(buttonAdd);
        tr.appendChild(thVariationType);
        tr.appendChild(thNameVariation);
        tr.appendChild(thAddDelete);
        thead.appendChild(tr);
        tblVariations.appendChild(thead);
        let tbody = document.createElement("tbody");
        console.log('variations:', permutationVariations);
        if (Validation.isEmpty(permutationVariations)) {
            permutationVariations = [PageStoreProductPermutations.createOptionUnselectedProductVariation()];
        }
        else {
            permutationVariations.forEach((permutationVariation, index) => {
                this.addProductPermutationVariationRow(tbody, permutationVariation);
            });
        }
        tblVariations.appendChild(tbody);
        let parent = element.parentElement;
        parent.innerHTML = '';
        parent.appendChild(tblVariations);
        console.log("tblVariations: ", tblVariations);
        let selectorButtonAdd = idTableMain + ' td.' + flagProductVariations + ' button.' + flagAdd;
        this.hookupEventHandler("click", selectorButtonAdd, this.handleClickButtonProductPermutationVariationsAdd);
        let selectorButtonDelete = idTableMain + ' td.' + flagProductVariations + ' button.' + flagDelete;
        this.hookupEventHandler("click", selectorButtonDelete, this.handleClickButtonProductPermutationVariationsDelete);
    }
    toggleProductPermutationVariationsColumnCollapsed(isCollapsed) {
        this.toggleColumnHasClassnameFlag(flagProductVariations, isCollapsed, flagCollapsed);
    }
    getElementProductVariations(element) {
        let permutationVariations = element.getAttribute(attrValueCurrent);
        let objVariations = [];
        let parts, new_variation, new_variation_type;
        if (!Validation.isEmpty(permutationVariations)) {
            permutationVariations = permutationVariations.split(',');
            permutationVariations.forEach((variation) => {
                parts = variation.split(':');
                if (parts.length == 2) {
                    console.log("parts: ", parts);
                    new_variation_type = productVariationTypes[parts[0].trim()];
                    new_variation = productVariations[parts[1].trim()];
                    objVariations.push({
                        [flagProductVariationType]: new_variation_type,
                        [flagProductVariation]: new_variation,
                    });
                }
                else {
                    console.log("error: invalid variation: ", variation);
                }
            });
        }
        return objVariations;
    }
    /*
    static createOptionUnselectedProductVariation() {
        return {
            [flagProductVariationType]: {
                [flagNameAttrOptionText]: [flagName],
                [flagNameAttrOptionValue]: [attrIdProductVariationType],
                [flagName]: 'Select Variation Type',
                [attrIdProductVariationType]: 0,
            },
            [flagProductVariation]: {
                [flagNameAttrOptionText]: [flagName],
                [flagNameAttrOptionValue]: [attrIdProductVariation],
                [flagName]: 'Select Variation',
                [attrIdProductVariation]: 0,
            },
        };
    }
    */
    handleClickButtonProductPermutationVariationsAdd(event, element) {
        let row = DOM.getRowFromElement(element);
        let tbody = row.querySelector('tbody');
        let permutationVariation = PageStoreProductPermutations.createOptionUnselectedProductVariation();
        this.addProductPermutationVariationRow(tbody, permutationVariation);
    }
    addProductPermutationVariationRow(tbody, permutationVariation) {
        let productVariationType, optionProductVariationTypeJson, optionProductVariationType, productVariation, optionProductVariationJson, optionProductVariation;
        /*
        if (Validation.isEmpty(variations)) {
            return;
        }
        */
        let productVariationKeys = Object.keys(productVariations);
        let productVariationTypeKeys = Object.keys(productVariationTypes);
        
        console.log("permutationVariation: ", permutationVariation);
        let permutationVariationJson = permutationVariation[flagProductVariation];
        let permutationVariationTypeJson = permutationVariation[flagProductVariationType];
        
        let tdVariationType = document.createElement("td");
        tdVariationType.classList.add(flagProductVariationType);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdVariationType, permutationVariationTypeJson[attrIdProductVariationType]);
        
        let ddlVariationType = document.createElement("select");
        ddlVariationType.classList.add(flagProductVariationType);
        DOM.setElementAttributesValuesCurrentAndPrevious(ddlVariationType, permutationVariationTypeJson[attrIdProductVariationType]);
        
        optionProductVariationType = DOM.createOption(null);
        console.log("optionProductVariationType: ", optionProductVariationType);
        ddlVariationType.appendChild(optionProductVariationType);

        productVariationTypeKeys.forEach((productVariationTypeKey) => {
            /*
            optionProductVariationType = document.createElement('option');
            optionProductVariationType.value = optionVariationType.value;
            optionProductVariationType.text = optionVariationType.text;
            */
            productVariationType = productVariationTypes[productVariationTypeKey];
            optionProductVariationTypeJson = BusinessObjects.getOptionJsonFromObjectJson(productVariationType, permutationVariationTypeJson[attrIdProductVariationType]);
            optionProductVariationType = DOM.createOption(optionProductVariationTypeJson);
            console.log("optionProductVariationType: ", optionProductVariationType);
            ddlVariationType.appendChild(optionProductVariationType);
        });
        
        let tdVariation = document.createElement("td");
        tdVariation.classList.add(flagProductVariation);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdVariation, permutationVariationJson[attrIdProductVariation]);

        let ddlVariation = document.createElement("select");
        ddlVariation.classList.add(flagProductVariation);
        DOM.setElementAttributesValuesCurrentAndPrevious(ddlVariation, permutationVariationJson[attrIdProductVariation]);
        
        optionProductVariation = DOM.createOption(null);
        console.log("optionProductVariation: ", optionProductVariation);
        ddlVariation.appendChild(optionProductVariation);

        productVariationKeys.forEach((productVariationKey) => {
            productVariation = productVariations[productVariationKey];
            optionProductVariationJson = BusinessObjects.getOptionJsonFromObjectJson(productVariation, permutationVariationJson[attrIdProductVariation]);
            optionProductVariation = DOM.createOption(optionProductVariationJson);
            console.log("optionProductVariation: ", optionProductVariation);
            ddlVariation.appendChild(optionProductVariation);
        });
        
        let tdDelete = document.createElement("td");
        tdDelete.classList.add(flagDelete);
        
        let buttonDelete = document.createElement("button");
        buttonDelete.classList.add(flagDelete);
        buttonDelete.textContent = 'x';

        let tr = document.createElement("tr");
        tdVariationType.appendChild(ddlVariationType);
        tr.appendChild(tdVariationType);
        tdVariation.appendChild(ddlVariation);
        tr.appendChild(tdVariation);
        tdDelete.appendChild(buttonDelete);
        tr.appendChild(tdDelete);
        tbody.appendChild(tr);
    }
    handleClickButtonProductPermutationVariationsDelete(event, element) {
        let row = getRowFromElement(element);
        let variationsCell = row.closest('td.' + flagProductVariations);
        row.remove();
        this.updateProductPermutationVariations(variationsCell);
    }
    updateProductPermutationVariations(variationsCell) {
        let variationPairsString = this.getProductPermutationVariationsText(variationsCell);
        variationsCell.setAttribute(attrValueCurrent, variationPairsString);
        DOM.isElementDirty(variationsCell);
    }
    getProductPermutationVariationsText(variationsTd) {
        let rows = variationsTd.querySelectorAll('tr');
        let variationPairsString = '';
        let ddlVariationType, ddlVariation, idVariationType, idVariation;
        rows.forEach((row, index) => {
            ddlVariationType = row.querySelector('td select.' + flagProductVariationType);
            ddlVariation = row.querySelector('td select.' + flagProductVariation);
            idVariationType = ddlVariationType.getAttribute(attrValueCurrent);
            idVariation = ddlVariation.getAttribute(attrValueCurrent);
            variationPairsString += idVariationType + ':' + idVariation + ',';
        });
        return variationPairsString;
    }

    hookupDescriptionTextareas() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDescription + ' textarea');
    }
    hookupCostFields(){
        this.hookupCurrencyCostFields();
        this.hookupCostInputs();
    }
    hookupCurrencyCostFields(){
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagCurrencyCost, Utils.getListFromDict(currencies));
    }
    hookupCostInputs(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostLocal + ' input');
    }
    hookupProfitFields(){
        // this.hookupCurrencyProfitFields();
        this.hookupProfitInputs();
    }
    /*
    hookupCurrencyProfitFields(){
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagCurrency, Utils.getListFromDict(currencies));
    }
    */
    hookupProfitInputs(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagProfitLocalMin + ' input');
    }
    hookupLatencyManufactureInputs(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagLatencyManufactureDays + ' input');
    }
    hookupQuantityFields(){
        this.hookupQuantityMinInputs();
        this.hookupQuantityMaxInputs();
        this.hookupQuantityStockInputs();
        this.hookupCountUnitMeasurementPerQuantityStepInputs();
        this.hookupUnitMeasurementQuantityFields();
    }
    hookupQuantityMinInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagQuantityMin + ' input');
    }
    hookupQuantityMaxInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagQuantityMax + ' input');
    }
    hookupQuantityStockInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagQuantityStock + ' input');
    }
    hookupCountUnitMeasurementPerQuantityStepInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCountUnitMeasurementPerQuantityStep + ' input');
    }
    hookupUnitMeasurementQuantityFields() {
        console.log("hooking up unit measurement quantity fields");
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagUnitMeasurementQuantity, Utils.getListFromDict(unitMeasurements));
    }
    hookupSubscriptionFields() {
        this.hookupIsSubscriptionFields();
        this.hookupIntervalRecurrenceFields();
        this.hookupCountIntervalRecurrenceInputs();
    }
    hookupIsSubscriptionFields(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagIsSubscription + ' input', (event, element) => {
            this.handleChangeElementCellTable(event, element);
            let isSubscription = DOM.getElementValueCurrent(element);
            let row = DOM.getRowFromElement(element);
            let inputCountIntervalRecurrence = row.querySelector('td.' + flagCountUnitMeasurementIntervalRecurrence + ' input');
            let divOrDdlIntervalRecurrence = row.querySelector('td.' + flagUnitMeasurementIntervalRecurrence + ' .' + flagUnitMeasurementIntervalRecurrence);
            if (isSubscription) {
                inputCountIntervalRecurrence.classList.remove(flagCollapsed);
                DOM.setElementValueCurrentIfEmpty(inputCountIntervalRecurrence, 1);
                divOrDdlIntervalRecurrence.classList.remove(flagCollapsed);
                let tdUnitMeasurementIntervalRecurrence = divOrDdlIntervalRecurrence.closest('td');
                tdUnitMeasurementIntervalRecurrence.dispatchEvent(new Event('click'));
            } else {
                inputCountIntervalRecurrence.classList.add(flagCollapsed);
                divOrDdlIntervalRecurrence.classList.add(flagCollapsed);
            }
        });
    }
    hookupIntervalRecurrenceFields(){
        this.hookupTableCellDDlPreviewsWhenNotCollapsed(idTableMain + ' td.' + flagUnitMeasurementIntervalRecurrence, Utils.getListFromDict(unitMeasurementsTime));
    }
    hookupCountIntervalRecurrenceInputs(){
        this.hookupChangeHandlerTableCellsWhenNotCollapsed("change", idTableMain + ' td.' + flagCountUnitMeasurementIntervalRecurrence + ' input');
    }
    hookupIdStripeProductInputs(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagIdStripeProduct + ' input');
    }
    hookupExpirationFields(){
        this.hookupDoesExpireFasterOnceUnsealedCheckboxes();
        this.hookupIntervalExpirationUnsealedFields();
        this.hookupCountIntervalExpirationUnsealedInputs();
    }
    hookupDoesExpireFasterOnceUnsealedCheckboxes(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDoesExpireFasterOnceUnsealed + ' input', (event, element) => {
            this.handleChangeElementCellTable(event, element);
            let doesExpireFasterOnceUnsealed = DOM.getElementValueCurrent(element);
            let row = DOM.getRowFromElement(element);
            let inputCountIntervalExpirationUnsealed = row.querySelector('td.' + flagCountUnitMeasurementIntervalExpirationUnsealed + ' input');
            let divOrDdlIntervalExpirationUnsealed = row.querySelector('td.' + flagUnitMeasurementIntervalExpirationUnsealed + ' .' + flagUnitMeasurementIntervalExpirationUnsealed);
            if (doesExpireFasterOnceUnsealed) {
                inputCountIntervalExpirationUnsealed.classList.remove(flagCollapsed);
                DOM.setElementValueCurrentIfEmpty(inputCountIntervalExpirationUnsealed, 1);
                divOrDdlIntervalExpirationUnsealed.classList.remove(flagCollapsed);
                let tdUnitMeasurementIntervalExpirationUnsealed = divOrDdlIntervalExpirationUnsealed.closest('td');
                tdUnitMeasurementIntervalExpirationUnsealed.dispatchEvent(new Event('click'));
            } else {
                inputCountIntervalExpirationUnsealed.classList.add(flagCollapsed);
                divOrDdlIntervalExpirationUnsealed.classList.add(flagCollapsed);
            }
        });
    }
    hookupIntervalExpirationUnsealedFields(){
        this.hookupTableCellDDlPreviewsWhenNotCollapsed(idTableMain + ' td.' + flagUnitMeasurementIntervalExpirationUnsealed, Utils.getListFromDict(unitMeasurementsTime));
    }
    hookupCountIntervalExpirationUnsealedInputs(){
        this.hookupChangeHandlerTableCellsWhenNotCollapsed("change", idTableMain + ' td.' + flagCountUnitMeasurementIntervalExpirationUnsealed + ' input');
    }
    hookupActiveCheckboxes(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagActive + ' input');
    }

    leave() {
        super.leave();
    }
}

