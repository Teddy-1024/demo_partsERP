 
import Events from "../../lib/events.js";
import TableBasePage from "../base_table.js";
import API from "../../api.js";
import DOM from "../../dom.js";
import StoreTableMixinPage from "./mixin_table.js";
import Utils from "../../lib/utils.js";

export default class PageStoreProducts extends TableBasePage {
    static hash = hashPageStoreProducts;
    static attrIdRowObject = attrIdProduct;
    callFilterTableContent = API.getProductsByFilters;
    callSaveTableContent = API.saveProducts;

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
        this.hookupFilterIsNotEmpty();
        this.hookupFilterActive();
    }
    hookupFilterProductCategory() {
        this.hookupFilter(flagProductCategory);
    }

    loadRowTable(rowJson) {
        return;
        if (rowJson == null) return;
        let row = _rowBlank.cloneNode(true);
        row.classList.remove(flagRowNew);
        row.classList.remove(flagInitialised);
        row.querySelectorAll('.' + flagInitialised).forEach(function(element) {
            element.classList.remove(flagInitialised);
        });
        let sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
        let tdProductCategory = row.querySelector('td.' + flagProductCategory);
        let divProductCategory = tdProductCategory.querySelector('div.' + flagProductCategory);
        let textareaName = row.querySelector('td.' + flagName + ' textarea');
        let tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
        let divAccessLevel = tdAccessLevel.querySelector('div.' + flagAccessLevel);
        let inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');

        DOM.setElementValuesCurrentAndPrevious(sliderDisplayOrder, rowJson[flagDisplayOrder]);
        DOM.setElementValuesCurrentAndPrevious(textareaCode, rowJson[flagCode]);
        DOM.setElementValuesCurrentAndPrevious(textareaName, rowJson[flagName]);
        DOM.setElementValuesCurrentAndPrevious(textareaDescription, rowJson[flagDescription]);
        tdAccessLevel.setAttribute(attrIdAccessLevel, rowJson[attrIdAccessLevel]);
        tdAccessLevel.setAttribute(flagAccessLevelRequired, rowJson[flagAccessLevelRequired]);
        divAccessLevel.setAttribute(attrIdAccessLevel, rowJson[attrIdAccessLevel]);
        DOM.setElementValuesCurrentAndPrevious(divAccessLevel, rowJson[attrIdAccessLevel]);
        divAccessLevel.textContent = rowJson[flagAccessLevelRequired];
        DOM.setElementValuesCurrentAndPrevious(inputActive, rowJson[flagActive]);
        row.setAttribute(rowJson[flagKeyPrimary], rowJson[rowJson[flagKeyPrimary]]);
        
        let table = TableBasePage.getTableMain();
        let bodyTable = table.querySelector('tbody');
        bodyTable.appendChild(row);
    }
    getJsonRow(row) {
        if (row == null) return;
        let sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
        let tdProductCategory = row.querySelector('td.' + flagProductCategory);
        let textareaName = row.querySelector('td.' + flagName + ' textarea');
        // let tdProductVariations = row.querySelector('td.' + flagProductVariations);
        let inputHasVariations = row.querySelector('td.' + flagHasVariations + ' input[type="checkbox"]');
        let tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
        let inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');

        let jsonProduct = {};
        jsonProduct[attrIdProduct] = row.getAttribute(attrIdProduct);
        jsonProduct[attrIdProductCategory] = DOM.getElementAttributeValueCurrent(tdProductCategory);
        jsonProduct[flagName] = DOM.getElementAttributeValueCurrent(textareaName);
        // jsonRow[flagProductVariations] = DOM.getElementAttributeValueCurrent(tdProductVariations);
        // jsonRow[flagHasVariations] = jsonRow[flagProductVariations] != '';
        jsonProduct[flagHasVariations] = DOM.getElementAttributeValueCurrent(inputHasVariations);
        // jsonProduct[flagAccessLevelRequired] = tdAccessLevel.getAttribute(flagAccessLevelRequired);
        jsonProduct[attrIdAccessLevel] = DOM.getElementAttributeValueCurrent(tdAccessLevel);
        jsonProduct[flagActive] = DOM.getElementAttributeValueCurrent(inputActive);
        jsonProduct[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(sliderDisplayOrder);
        return jsonProduct;
    }
    initialiseRowNew(row) {
        if (row == null) return;
        let slidersDisplayOrder = document.querySelectorAll('td.' + flagDisplayOrder + ' input.' + flagSlider);
        let maxDisplayOrder = 0;
        slidersDisplayOrder.forEach((slider) => {
            maxDisplayOrder = Math.max(maxDisplayOrder, parseFloat(DOM.getElementValueCurrent(slider)));
        });
        let sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
        DOM.setElementValuesCurrentAndPrevious(sliderDisplayOrder, maxDisplayOrder + 1);
    }

    hookupTableMain() {
        super.hookupTableMain();
        this.hookupSlidersDisplayOrderTable();
        this.hookupTdsProductCategory();
        this.hookupTextareasNameTable();
        this.hookupInputsHasVariationsTable();
        this.hookupTdsAccessLevel();
        this.hookupInputsActiveTable();
    }
    hookupTdsProductCategory() {
        let cellSelector = idTableMain + ' tbody td.' + flagProductCategory;
        this.hookupTableCellDdlPreviews(cellSelector, Utils.getListFromDict(productCategories));
    }
    hookupInputsHasVariationsTable() {
        let cellSelector = idTableMain + ' tbody td.' + flagHasVariations + ' input[type="checkbox"]';
        this.hookupChangeHandlerTableCells(cellSelector);
    }
    
    /*
    isDirtyRow(row) {
        if (row == null) return false;
        console.log("Product Product isDirtyRow");
        console.log("row: ", row);
        let sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder);
        let inputCode = row.querySelector('td.' + flagCode + ' textarea');
        let inputName = row.querySelector('td.' + flagName + ' textarea');
        let inputDescription = row.querySelector('td.' + flagDescription + ' textarea');
        let tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
        let inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');
        let isDirty = sliderDisplayOrder.classList.contains(flagDirty) || inputCode.classList.contains(flagDirty) || inputName.classList.contains(flagDirty) || 
            inputDescription.classList.contains(flagDirty) || tdAccessLevel.classList.contains(flagDirty) || inputActive.classList.contains(flagDirty);
        DOM.handleDirtyElement(row, isDirty);
        return isDirty;
    }
    */
    
    leave() {
        super.leave();
    }

    /*
    getFiltersDefaults() {
        filters = {};
        filters.flagIsNotEmpty = true;
        filters.flagActive = true;
        return filters;
    }
    */
}

