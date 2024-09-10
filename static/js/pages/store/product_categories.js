
import { TableBasePage } from "../base_table.js";
import API from "../../api.js";
import DOM from "../../dom.js";

export class PageStoreProductCategories extends TableBasePage {
    static hash = hashPageStoreProductCategories;
    callFilterTableContent = API.getCategoriesByFilters;
    callSaveTableContent = API.saveCategories;

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
        initialiseEventHandler('.' + flagIsNotEmpty, flagInitialised, (filter) => {
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
        DOM.setElementValuePrevious(sliderDisplayOrder, rowJson[flagDisplayOrder]);
        DOM.setElementValueCurrent(textareaCode, rowJson[flagCode]);
        DOM.setElementValuePrevious(textareaCode, rowJson[flagCode]);
        DOM.setElementValueCurrent(textareaName, rowJson[flagName]);
        DOM.setElementValuePrevious(textareaName, rowJson[flagName]);
        DOM.setElementValueCurrent(textareaDescription, rowJson[flagDescription]);
        DOM.setElementValuePrevious(textareaDescription, rowJson[flagDescription]);
        tdAccessLevel.setAttribute(attrIdAccessLevel, rowJson[attrIdAccessLevel]);
        tdAccessLevel.setAttribute(flagAccessLevelRequired, rowJson[flagAccessLevelRequired]);
        divAccessLevel.setAttribute(attrIdAccessLevel, rowJson[attrIdAccessLevel]);
        DOM.setElementValueCurrent(divAccessLevel, rowJson[attrIdAccessLevel]);
        DOM.setElementValuePrevious(divAccessLevel, rowJson[attrIdAccessLevel]);
        divAccessLevel.textContent = rowJson[flagAccessLevelRequired];
        DOM.setElementValueCurrent(inputActive, rowJson[flagActive]);
        DOM.setElementValuePrevious(inputActive, rowJson[flagActive]);
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
        jsonCategory[attrIdCategory] = row.getAttribute(attrIdCategory);
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

