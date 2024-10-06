 
import Events from "../../lib/events.js";
import TableBasePage from "../base_table.js";
import API from "../../api.js";
import DOM from "../../dom.js";
import StoreTableMixinPage from "./mixin_table.js";

export default class PageStoreProductCategories extends TableBasePage {
    static hash = hashPageStoreProductCategories;
    callFilterTableContent = API.getCategoriesByFilters;
    callSaveTableContent = API.saveCategories;

    constructor(router) {
        super(router);
        this.storeMixin = new StoreTableMixinPage(this);
    }

    initialize() {
        this.sharedInitialize();
    }

    hookupFilters() {
        this.sharedHookupFilters();
        this.hookupFilterIsNotEmpty();
        this.hookupFilterActive();
    }
    hookupFilterIsNotEmpty() {
        this.hookupEventHandler("change", idFormFilters + ' .' + flagIsNotEmpty, (event, filter) => {
            PageStoreProductCategories.isDirtyFilter(filter);
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
        // jsonCategory[flagAccessLevelRequired] = tdAccessLevel.getAttribute(flagAccessLevelRequired);
        jsonCategory[attrIdAccessLevel] = DOM.getElementValueCurrent(tdAccessLevel);
        jsonCategory[flagActive] = DOM.getElementValueCurrent(inputActive);
        jsonCategory[flagDisplayOrder] = sliderDisplayOrder.getAttribute(attrValueCurrent);
        return jsonCategory;
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
        this.hookupTextareasCodeTable();
        this.hookupTextareasNameTable();
        this.hookupTextareasDescriptionTable();
        this.hookupTdsAccessLevel();
        this.hookupInputsActiveTable();
    }
    
    /*
    isDirtyRow(row) {
        if (row == null) return false;
        console.log("Product Category isDirtyRow");
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

