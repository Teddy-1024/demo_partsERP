
import API from "../../api.js";
import BusinessObjects from "../../lib/business_objects/business_objects.js";
import DOM from "../../dom.js";
import Events from "../../lib/events.js";
import TableBasePage from "../base_table.js";
import Utils from "../../lib/utils.js";
import Validation from "../../lib/validation.js";
import StoreTableMixinPage from "./mixin_table.js";

export default class PageStoreStockItems extends TableBasePage {
    static hash = hashPageStoreStockItems;
    static attrIdRowObject = attrIdStockItem;
    callFilterTableContent = API.getStockItemsByFilters;
    callSaveTableContent = API.saveStockItems;

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
            PageStoreStockItems.isDirtyFilter(filterCategory);
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
    }
    getJsonRow(row) {
        if (row == null) return;
        let tdProductCategory = row.querySelector('td.' + flagProductCategory);
        let tdProduct = row.querySelector('td.' + flagProduct);
        let tdProductVariations = row.querySelector('td.' + flagProductVariations);
        let tdCurrencyCost = row.querySelector('td.' + flagCurrencyCost);
        let inputCostLocalVatExcl = row.querySelector('td.' + flagCostUnitLocalVatExcl + ' input');
        let inputCostLocalVatIncl = row.querySelector('td.' + flagCostUnitLocalVatIncl + ' input');
        let inputDatePurchased = row.querySelector('td.' + flagDatePurchased + ' input');
        let inputDateReceived = row.querySelector('td.' + flagDateReceived + ' input');
        let tdStorageLocation = row.querySelector('td.' + flagStorageLocation);
        let inputIsSealed = row.querySelector('td.' + flagIsSealed + ' input');
        let inputDateUnsealed = row.querySelector('td.' + flagDateUnsealed + ' input');
        let inputDateExpiration = row.querySelector('td.' + flagDateExpiration + ' input');
        let inputIsConsumed = row.querySelector('td.' + flagIsConsumed + ' input');
        let inputDateConsumed = row.querySelector('td.' + flagDateConsumed + ' input');
        let checkboxActive = row.querySelector('td.' + flagActive + ' input');

        let jsonRow = {};
        jsonRow[attrIdStockItem] = row.getAttribute(attrIdStockItem);
        jsonRow[attrIdProductPermutation] = tdProductVariations.getAttribute(attrIdProductPermutation);
        jsonRow[attrIdProductCategory] = DOM.getElementAttributeValueCurrent(tdProductCategory);
        jsonRow[attrIdProduct] = DOM.getElementAttributeValueCurrent(tdProduct);
        jsonRow[flagProductVariations] = DOM.getElementAttributeValueCurrent(tdProductVariations);
        jsonRow[flagHasVariations] = jsonRow[flagProductVariations] != '';
        jsonRow[flagCurrencyCost] = DOM.getElementAttributeValueCurrent(tdCurrencyCost);
        jsonRow[flagCostUnitLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputCostLocalVatExcl);
        jsonRow[flagCostUnitLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputCostLocalVatIncl);
        jsonRow[flagDatePurchased] = DOM.getElementAttributeValueCurrent(inputDatePurchased);
        jsonRow[flagDateReceived] = DOM.getElementAttributeValueCurrent(inputDateReceived);
        jsonRow[attrIdStorageLocation] = DOM.getElementAttributeValueCurrent(tdStorageLocation);
        jsonRow[flagIsSealed] = DOM.getElementAttributeValueCurrent(inputIsSealed);
        jsonRow[flagDateUnsealed] = DOM.getElementAttributeValueCurrent(inputDateUnsealed);
        jsonRow[flagDateExpiration] = DOM.getElementAttributeValueCurrent(inputDateExpiration);
        jsonRow[flagIsConsumed] = DOM.getElementAttributeValueCurrent(inputIsConsumed);
        jsonRow[flagDateConsumed] = DOM.getElementAttributeValueCurrent(inputDateConsumed);
        jsonRow[flagActive] = checkboxActive.getAttribute(attrValueCurrent);
        return jsonRow;
    }
    initialiseRowNew(row) {
        super.initialiseRowNew(row);
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
        this.hookupProductCategoryFields();
        this.hookupProductFields();
        this.hookupFieldsProductPermutationVariation();
        this.hookupCurrencyCostFields();
        this.hookupCostInputs();
        this.hookupOrderDateInputs();
        this.hookupStorageLocationFields();
        this.hookupSealingInputs();
        this.hookupExpirationDateInputs();
        this.hookupConsumationInputs();
        this.hookupActiveCheckboxes();
    }
    hookupProductCategoryFields() {
        this.hookupTableCellDdlPreviews(
            idTableMain + ' td.' + flagProductCategory
            , Utils.getListFromDict(productCategories)
            , (event, element) => { this.hookupProductCategoryDdls(event, element); }
        );
    }
    hookupProductFields() {
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagProduct, Utils.getListFromDict(products));
    }

    handleClickProductPermutationVariationsPreview(event, element) {
        let row = DOM.getRowFromElement(element);
        let tdProduct = row.querySelector('td.' + flagProduct);
        let idProduct = DOM.getElementValueCurrent(tdProduct);
        let product = products[idProduct];
        if (!product[flagHasVariations]) return;
        super.handleClickProductPermutationVariationsPreview(event, element);
    }
    handleClickButtonProductPermutationVariationsAdd(event, element) {
        let row = DOM.getRowFromElement(element);
        let tbody = row.querySelector('tbody');
        let permutationVariation = PageStoreStockItems.createOptionUnselectedProductVariation();
        this.addProductPermutationVariationRow(tbody, permutationVariation);
    }
    
    hookupCurrencyCostFields(){
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagCurrencyCost, Utils.getListFromDict(currencies));
    }
    hookupCostInputs(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostUnitLocalVatExcl + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostUnitLocalVatIncl + ' input');
    }
    hookupOrderDateInputs(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDatePurchased + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDateReceived + ' input');
    }

    hookupStorageLocationFields(){
        this.hookupEventHandler(
            "click", 
            idTableMain + ' td.' + flagStorageLocation, 
            (event, element) => this.handleClickStorageLocationPreview(event, element)
        );
    }
    handleClickStorageLocationPreview(event, element) {
        this.toggleColumnCollapsed(flagStorageLocation, false);
        let idPlant = element.getAttribute(attrIdPlant);
        let idStorageLocation = element.getAttribute(attrIdStorageLocation);
        let tblStorageLocation = document.createElement("table");
        tblStorageLocation.classList.add(flagProductVariations);
        let thead = document.createElement("thead");
        let thPlant = document.createElement("th");
        thPlant.textContent = 'Plant';
        let thLocation = document.createElement("th");
        thLocation.textContent = 'Location';
        let trHead = document.createElement("tr");
        trHead.appendChild(thPlant);
        trHead.appendChild(thLocation);
        thead.appendChild(trHead);
        tblStorageLocation.appendChild(thead);
        let tbody = document.createElement("tbody");
        
        let plant, optionPlantJson, optionPlant, storageLocation, optionStorageLocationJson, optionStorageLocation;
        let plantKeys = Object.keys(plants);
        let storageLocationKeys = Object.keys(storageLocations);
        
        let plantJson = plants[idPlant];
        let storageLocationJson = storageLocations[idStorageLocation];
        
        let tdPlant = document.createElement("td");
        tdPlant.classList.add(flagPlant);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdPlant, plantJson[attrIdPlant]);
        
        let ddlPlant = document.createElement("select");
        ddlPlant.classList.add(flagPlant);
        DOM.setElementAttributesValuesCurrentAndPrevious(ddlPlant, plantJson[attrIdPlant]);
        
        optionPlant = DOM.createOption(null);
        if (_verbose) { console.log("optionPlant: ", optionPlant); }
        ddlPlant.appendChild(optionPlant);

        plantKeys.forEach((plantKey) => {
            plant = plants[plantKey];
            optionPlantJson = BusinessObjects.getOptionJsonFromObjectJson(
                objectJson = plant, 
                valueSelected = plantJson[attrIdPlant]
            );
            optionPlant = DOM.createOption(optionPlantJson);
            if (_verbose) { console.log("optionPlant: ", optionPlant); }
            ddlPlant.appendChild(optionPlant);
        });
        
        let tdStorageLocation = document.createElement("td");
        tdStorageLocation.classList.add(flagStorageLocation);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdStorageLocation, storageLocationJson[attrIdStorageLocation]);

        let ddlStorageLocation = document.createElement("select");
        ddlStorageLocation.classList.add(flagStorageLocation);
        DOM.setElementAttributesValuesCurrentAndPrevious(ddlStorageLocation, storageLocationJson[attrIdStorageLocation]);
        
        optionStorageLocation = DOM.createOption(null);
        if (_verbose) { console.log("optionStorageLocation: ", optionStorageLocation); }
        ddlStorageLocation.appendChild(optionStorageLocation);

        StorageLocationKeys.forEach((StorageLocationKey) => {
            storageLocation = StorageLocations[StorageLocationKey];
            optionStorageLocationJson = BusinessObjects.getOptionJsonFromObjectJson(
                objectJson = storageLocation, 
                valueSelected = storageLocationJson[attrIdStorageLocation]
            );
            optionStorageLocation = DOM.createOption(optionStorageLocationJson);
            if (_verbose) { console.log("optionStorageLocation: ", optionStorageLocation); }
            ddlStorageLocation.appendChild(optionStorageLocation);
        });

        let trBody = document.createElement("tr");
        tdPlant.appendChild(ddlPlant);
        trBody.appendChild(tdPlant);
        tdStorageLocation.appendChild(ddlStorageLocation);
        trBody.appendChild(tdStorageLocation);
        tbody.appendChild(trBody);

        tblStorageLocation.appendChild(tbody);
        let parent = element.parentElement;
        parent.innerHTML = '';
        parent.appendChild(tblStorageLocation);
        if (_verbose) { console.log("tblStorageLocation: ", tblStorageLocation); }
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagPlant + ' select', (event, element) => { this.handleChangeStoragePlantDdl(event, element); });
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagStorageLocation + ' select', (event, element) => { this.handleChangeStorageLocationDdl(event, element); });
    }
    handleChangeStoragePlantDdl(event, ddlPlant) {
        this.handleChangeNestedElementCellTable(event, ddlPlant);
        let row = DOM.getRowFromElement(ddlPlant);
        let ddlStorageLocation = row.querySelector('td.' + flagStorageLocation + ' select');
        ddlStorageLocation.innerHTML = '';
        ddlStorageLocation.appendChild(DOM.createOption(null));
        let idPlant = DOM.getElementValueCurrent(ddlPlant);
        let storageLocations = plants[idPlant][flagStorageLocations];
        let optionJson, option;
        storageLocations.forEach((storageLocation) => {
            optionJson = BusinessObjects.getOptionJsonFromObjectJson(storageLocation);
            option = DOM.createOption(optionJson);
            ddlStorageLocation.appendChild(option);
        });
        this.handleChangeNestedElementCellTable(event, ddlStorageLocation);
    }
    handleChangeStorageLocationDdl(event, ddlStorageLocation) {
        this.handleChangeNestedElementCellTable(event, ddlStorageLocation);
    }

    hookupSealingInputs() {
        this.hookupIsSealedFields();
        this.hookupDateUnsealedInputs();
    }
    hookupIsSealedFields(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagIsSealed + ' input', (event, element) => {
            this.handleChangeNestedElementCellTable(event, element);
            let isSealed = DOM.getElementValueCurrent(element);
            let row = DOM.getRowFromElement(element);
            let inputDateUnsealed = row.querySelector('td.' + flagDateUnsealed + ' input');
            if (isSealed) {
                inputDateUnsealed.classList.add(flagCollapsed);
            } else {
                inputDateUnsealed.classList.remove(flagCollapsed);
            }
        });
    }
    hookupDateUnsealedInputs(){
        this.hookupChangeHandlerTableCellsWhenNotCollapsed("change", idTableMain + ' td.' + flagDateUnsealed + ' input');
    }
    
    hookupExpirationDateInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDateExpiration + ' input');
    }

    hookupConsumationInputs() {
        this.hookupIsConsumedFields();
        this.hookupDateConsumedInputs();
    }
    hookupIsConsumedFields(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagIsConsumed + ' input', (event, element) => {
            this.handleChangeNestedElementCellTable(event, element);
            let isConsumed = DOM.getElementValueCurrent(element);
            let row = DOM.getRowFromElement(element);
            let inputDateConsumed = row.querySelector('td.' + flagDateConsumed + ' input');
            if (isConsumed) {
                inputDateConsumed.classList.remove(flagCollapsed);
            } else {
                inputDateConsumed.classList.add(flagCollapsed);
            }
        });
    }
    hookupDateConsumedInputs(){
        this.hookupChangeHandlerTableCellsWhenNotCollapsed("change", idTableMain + ' td.' + flagDateConsumed + ' input');
    }

    hookupActiveCheckboxes(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagActive + ' input');
    }

    leave() {
        super.leave();
    }
}

