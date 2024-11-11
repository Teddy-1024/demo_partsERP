
import API from "../../api.js";
import BusinessObjects from "../../lib/business_objects/business_objects.js";
import DOM from "../../dom.js";
import Events from "../../lib/events.js";
import TableBasePage from "../base_table.js";
import Utils from "../../lib/utils.js";
import Validation from "../../lib/validation.js";
import StoreTableMixinPage from "./mixin_table.js";

export default class PageStoreProductPermutations extends TableBasePage {
    static hash = hashPageStoreProductPermutations;
    static attrIdRowObject = attrIdProductPermutation;
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
        if (rowJson == null) return;
        if (_verbose) { console.log("applying data row: ", rowJson); }
        /*
        let tableMain = TableBasePage.getTableMain();
        let row = _rowBlank.cloneNode(true);
        row.classList.remove(flagRowNew);
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
        let inputLatencyManufactureDays = row.querySelector('td.' + flagLatencyManufacture + ' input');
        DOM.setElementValuesCurrentAndPrevious(inputLatencyManufactureDays, rowJson[flagLatencyManufacture]);
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
        let inputCostLocalVatExcl = row.querySelector('td.' + flagCostUnitLocalVatExcl + ' input');
        let inputCostLocalVatIncl = row.querySelector('td.' + flagCostUnitLocalVatIncl + ' input');
        let tdCurrencyCost = row.querySelector('td.' + flagCurrencyCost);
        let inputProfitLocalMin = row.querySelector('td.' + flagProfitLocalMin + ' input');
        let inputLatencyManufactureDays = row.querySelector('td.' + flagLatencyManufacture + ' input');
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
        jsonRow[flagCostUnitLocalVatExcl] = inputCostLocalVatExcl.getAttribute(attrValueCurrent);
        jsonRow[flagCostUnitLocalVatIncl] = inputCostLocalVatIncl.getAttribute(attrValueCurrent);
        jsonRow[flagCurrencyCost] = tdCurrencyCost.getAttribute(attrValueCurrent);
        jsonRow[flagProfitLocalMin] = inputProfitLocalMin.getAttribute(attrValueCurrent);
        jsonRow[flagLatencyManufacture] = inputLatencyManufactureDays.getAttribute(attrValueCurrent);
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
        if (_verbose) { 
            console.log("initialiseRowNew: ", row);
            console.log({ddlCategoryFilter, idProductCategoryFilter, hasCategoryFilter, ddlProductFilter, idProductFilter, hasProductFilter}); 
        }
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
        this.hookupFieldsProductCategory();
        this.hookupProductFields();
        this.hookupFieldsProductPermutationVariation();
        this.hookupDescriptionTextareas();
        this.hookupCostFields();
        this.hookupLatencyManufactureInputs();
        this.hookupQuantityFields();
        this.hookupSubscriptionFields();
        this.hookupIdStripeProductInputs();
        this.hookupExpirationFields();
        this.hookupFieldsActive();
    }
    hookupFieldsProductCategory() {
        this.hookupTableCellDdlPreviews(
            idTableMain + ' td.' + flagProductCategory
            , Utils.getListFromDict(productCategories)
            , (cellSelector) => { this.hookupProductCategoryDdls(cellSelector); }
        );
    }
    hookupProductFields() {
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagProduct, Utils.getListFromDict(products));
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
        /*
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostUnitLocalVatExcl + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostUnitLocalVatIncl + ' input');
        */
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
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagLatencyManufacture + ' input');
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
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagUnitMeasurementQuantity, Utils.getListFromDict(unitMeasurements));
    }
    hookupSubscriptionFields() {
        this.hookupIsSubscriptionFields();
        this.hookupIntervalRecurrenceFields();
        this.hookupCountIntervalRecurrenceInputs();
    }
    hookupIsSubscriptionFields(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagIsSubscription + ' input', (event, element) => {
            this.handleChangeNestedElementCellTable(event, element);
            let isSubscription = DOM.getElementValueCurrent(element);
            let row = DOM.getRowFromElement(element);
            let inputCountIntervalRecurrence = row.querySelector('td.' + flagCountUnitMeasurementIntervalRecurrence + ' input');
            let divOrDdlIntervalRecurrence = row.querySelector('td.' + flagUnitMeasurementIntervalRecurrence + ' .' + flagUnitMeasurementIntervalRecurrence);
            if (isSubscription) {
                inputCountIntervalRecurrence.classList.remove(flagCollapsed);
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
            this.handleChangeNestedElementCellTable(event, element);
            let doesExpireFasterOnceUnsealed = DOM.getElementValueCurrent(element);
            let row = DOM.getRowFromElement(element);
            let inputCountIntervalExpirationUnsealed = row.querySelector('td.' + flagCountUnitMeasurementIntervalExpirationUnsealed + ' input');
            let divOrDdlIntervalExpirationUnsealed = row.querySelector('td.' + flagUnitMeasurementIntervalExpirationUnsealed + ' .' + flagUnitMeasurementIntervalExpirationUnsealed);
            if (doesExpireFasterOnceUnsealed) {
                inputCountIntervalExpirationUnsealed.classList.remove(flagCollapsed);
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

    leave() {
        super.leave();
    }
}

