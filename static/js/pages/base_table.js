
import Events from "../lib/events.js";
import LocalStorage from "../lib/local_storage.js";
import Validation from "../lib/validation.js";
import BasePage from "./base.js";
import API from "../api.js";
import DOM from "../dom.js";

export default class TableBasePage extends BasePage {
    // callFilterTableContent
    // callSaveTableContent

    constructor(router) {
        super(router);
        /*
        if (!this.constructor.callFilterTableContent) {
            throw new Error(`Class ${this.constructor.name} must have a static callFilterTableContent method attribute that takes a single argument - the filters as json.`);
        }
        if (!this.constructor.callSaveTableContent) {
            throw new Error(`Class ${this.constructor.name} must have a static callSaveTableContent method attribute that takes 3 arguments - a list of records, the filters as json, and a comment for saving.`);
        }
        this.initialize();
        // this.hookupFilters();
        this.loadRowTable(null);
        this.getJsonRow(null);
        // this.hookupTableMain();
        this.isDirtyRow(null);
        this.getTableRecords();
        this.leave();
        */
        // this.cursorXInitial = null;
        this.cursorYInitial = null;
        this.rowInitial = null;
        this.placeholder = null;
        this.dragSrcEl = null;
        this.dragSrcRow = null;

    }
    
    initialize(isPopState = false) {
        if (this.constructor === TableBasePage) {
            throw new Error("Must implement initialize() method.");
        }
        if (!isPopState) {
            this.sharedInitialize();
            this.hookupFilters();
            this.hookupButtonsAddSaveCancel();
            this.hookupTableMain();
            hookupOverlayConfirm(() => {
                this.leave();
                this.saveRecordsTableDirty();
            });
        } else {
            let dataPage = this.getLocalStoragePage();
            let filters = dataPage[flagFormFilters];
            let formFilters = this.getFormFilters();
            let filtersDefault = DOM.convertForm2JSON(formFilters);
            if (!Validation.areEqualDicts(filters, filtersDefault)) {

            }
        }
    }
    hookupFilters() {
        if (this.constructor === TableBasePage) {
            throw new Error("Subclass of TableBasePage must implement method hookupFilters().");
        }
        this.hookupButtonApplyFilters();
    }
    hookupFilterActive() {
        Events.initialiseEventHandler(idFormFilters + '.' + flagActive, flagInitialised, (filter) => {
            filter.addEventListener("change", (event) => {
                TableBasePage.isDirtyFilter(filter);
            });
        });
    }
    static isDirtyFilter(filter) {
        let isDirty = DOM.isElementDirty(filter);
        if (isDirty) {
            let tbody = document.querySelector(idTableMain + ' tbody');
            tbody.querySelectorAll('tr').remove();
            tbody.appendChild(document.createElement('<div>Press "Apply Filters" to refresh the table.</div>'));
        }
        return isDirty;
    }
    hookupButtonApplyFilters() {
        Events.initialiseEventHandler(idButtonApplyFilters, flagInitialised, (button) => {
            button.addEventListener("click", (event) => {
                event.stopPropagation();
                this.getAndLoadFilteredTableContent();
            });
        });
    }
    getAndLoadFilteredTableContent() {
        let formFilters = this.getFormFilters();
        let filtersJson = DOM.convertForm2JSON(formFilters);
        this.callFilterTableContent(filtersJson)
        /*
            .then(data => {
                console.log('Table data received:', data);
                this.callbackLoadTableContent(data);
            })
        */
            .catch(error => console.error('Error:', error));
    }
    getFormFilters() {
        return document.querySelector(idFormFilters);    
    }
    callbackLoadTableContent(response) {
        let table = this.getTableMain();
        let bodyTable = table.querySelector('tbody');
        bodyTable.querySelectorAll('tr').forEach(function(row) { row.remove(); });
        let rowsJson = response.data[flagRows];
        if (!Validation.isEmpty(rowsJson) && rowsJson.every(row => row.hasOwnProperty('display_order'))) {
            rowsJson = rowsJson.sort((a, b) => a.display_order - b.display_order);
        }
        rowsJson.forEach(this.loadRowTable.bind(this));
        this.hookupTableMain();
    }
    getTableMain() {
        return document.querySelector(idTableMain);
    }
    loadRowTable(rowJson) {
        throw new Error("Subclass of TableBasePage must implement method loadRowTable().");
    }
    hookupButtonsAddSaveCancel() {
        this.hookupButtonSave();
        this.hookupButtonCancel();
        this.hookupButtonAddRowTable();
    }
    saveRecordsTableDirty() {
        let records = this.getTableRecords(true);
        if (records.length == 0) {
            showOverlayError('No records to save');
            return;
        }
        let formElement = this.getFormFilters();
        let comment = DOM.getElementValueCurrent(document.querySelector(idTextareaConfirm));
        this.callSaveTableContent(records, formElement, comment)
            .then(data => {
                if (data[flagStatus] == flagSuccess) {
                    console.log('Data received:', data);
                    this.callbackLoadTableContent(data);
                    console.log('Records saved!');
                }
                else {
                    showOverlayError(data[flagMessage]);
                }
            })
            .catch(error => console.error('Error:', error));
    }
    getTableRecords(dirtyOnly = false) {
        let table = this.getTableMain();
        let records = [];
        let record;
        table.querySelectorAll('tbody tr').forEach((row) => {
            if (dirtyOnly && !row.classList.contains(flagDirty)) return;
            record = this.getJsonRow(row);
            records.push(record);
        });
        return records;
    }
    getJsonRow(row) {
        throw new Error("Subclass of TableBasePage must implement method getJsonRow().");
    }
    hookupButtonCancel() {
        Events.initialiseEventHandler(idFormFilters + ' button.' + flagCancel, flagInitialised, function(button) {
            button.addEventListener("click", function(event) {
                event.stopPropagation();
                getAndLoadFilteredTableContent();
            });
            button.classList.add(flagCollapsed);
        });
    }
    hookupButtonAddRowTable() {
        Events.initialiseEventHandler(idFormFilters + ' button.' + flagAdd, flagInitialised, (button) => {
            button.addEventListener("click", (event) => {
                event.stopPropagation();
                let tbody = document.querySelector(idTableMain + ' tbody');
                let row = _rowBlank.cloneNode(true);
                row.classList.remove(flagInitialised);
                row.querySelectorAll('.' + flagInitialised).forEach(function(element) {
                    element.classList.remove(flagInitialised);
                });
                let newDisplayOrder = parseInt(tbody.querySelector('tr:last-child').querySelector('td.' + flagDisplayOrder + ' .' + flagSlider).getAttribute(attrValueCurrent)) + 1;
                tbody.appendChild(row);
                let slider = tbody.querySelector('tr:last-child').querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
                if (slider) {
                    slider.setAttribute(attrValueCurrent, newDisplayOrder);
                    slider.setAttribute(attrValuePrevious, newDisplayOrder);
                }
                this.hookupTableMain();
            });
        });
    }
    hookupTableMain() {
        if (this.constructor === TableBasePage) {
            throw new Error("Must implement hookupTableMain() method.");
        }
        if (_rowBlank == null) {
            this.cacheRowBlank();
        }
    }
    cacheRowBlank() {
        let selectorRowNew = idTableMain + ' tbody tr.' + flagRowNew;
        let rowBlankTemp = document.querySelector(selectorRowNew);
        console.log("row blank temp: ", rowBlankTemp);
        _rowBlank = rowBlankTemp.cloneNode(true);
        document.querySelectorAll(selectorRowNew).forEach(function(row) {
            row.remove();
        });
    }
    hookupSlidersDisplayOrderTable() {
        let selectorDisplayOrder = idTableMain + ' tbody tr td.' + flagDisplayOrder + ' input.' + flagSlider + '.' + flagDisplayOrder;
        Events.initialiseEventHandler(selectorDisplayOrder, flagInitialised, (sliderDisplayOrder) => {
            /*
            sliderDisplayOrder.setAttribute('draggable', true);
            sliderDisplayOrder.addEventListener('dragstart', this.handleDragSliderStart.bind(this), false);
            sliderDisplayOrder.addEventListener('dragenter', this.handleDragSliderEnter.bind(this), false);
            sliderDisplayOrder.addEventListener('dragover', this.handleDragSliderOver.bind(this), false);
            sliderDisplayOrder.addEventListener('dragleave', this.handleDragSliderLeave.bind(this), false);
            sliderDisplayOrder.addEventListener('drop', this.handleDropSlider.bind(this), false);
            sliderDisplayOrder.addEventListener('dragend', this.handleDragSliderEnd.bind(this), false);
            */
            sliderDisplayOrder.addEventListener('change', (event) => {
                console.log("slider change event");
                this.handleChangeElementCellTable(sliderDisplayOrder);
            });
        });
    }
    /* ToDo: Fix this slider drag and drop functionality
    handleDragSliderStart(event) {
        this.dragSrcEl = event.target;
        event.dataTransfer.effectAllowed = flagMove;
        /*
        console.log("setting outer html: ", this.dragSrcEl.outerHTML);
        event.dataTransfer.setData('text/html', this.dragSrcEl.outerHTML);
        *
        this.dragSrcRow = DOM.getRowFromElement(this.dragSrcEl);
        this.dragSrcEl.classList.add(flagDragging);
    }
    handleDragSliderOver(event) {
        if (event.preventDefault) {
            event.preventDefault();
        }
        event.dataTransfer.dropEffect = flagMove;
        return false;
    }
    handleDragSliderEnter(event) {
        event.target.closest('tr').classList.add(flagDragOver);
    }
    handleDragSliderLeave(event) {
        event.target.closest('tr').classList.remove(flagDragOver);
    }
    handleDropSlider(event) {
        event.stopPropagation();
        let targetRow = DOM.getRowFromElement(event.target);
        if (this.dragSourceRow != targetRow) {
            targetRow.classList.remove(flagDragOver);
            this.dragSrcEl.classList.remove(flagDragging);
            let sourceRowClone = this.dragSrcRow.cloneNode(true);
            let targetRowClone = targetRow.cloneNode(true);
            console.log("sourceRowClone: ", sourceRowClone);
            console.log("targetRowClone: ", targetRowClone);
            let tbody = targetRow.closest('tbody');
            tbody.replaceChild(sourceRowClone, targetRow);
            tbody.replaceChild(targetRowClone, this.dragSrcRow);
            this.refreshDisplayOrders();
        }
        return false;
    }
    handleDragSliderEnd(event) {
        let table = this.getTableMain();
        let rows = table.querySelectorAll('tr');
        rows.forEach(row => {
            row.classList.remove(flagDragOver);
            row.classList.remove(flagDragging);
        });
    }
    refreshDisplayOrders() {
        console.log("updating display order values");
        let rows = document.querySelectorAll(idTableMain + 'tbody tr.' + flagRow);
        rows.forEach((row, indexRow) => {
            sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
            sliderDisplayOrder.setAttribute(attrValueCurrent, indexRow);
        });
    }
    */
    hookupTextareasCodeTable() {
        let selectorCode = idTableMain + ' tbody tr td.' + flagCode + ' textarea';
        Events.initialiseEventHandler(selectorCode, flagInitialised, (textareaCode) => {
            textareaCode.addEventListener("change", (event) => {
                console.log("textarea change event");
                this.handleChangeElementCellTable(textareaCode);
            });
        });
    }
    handleChangeElementCellTable(element) {
        let row = DOM.getRowFromElement(element);
        let td = DOM.getCellFromElement(element);
        console.log("td: ", td);
        let wasDirtyRow = this.isDirtyRow(row);
        let wasDirtyElement = element.classList.contains(flagDirty);
        let isDirtyElement = DOM.isElementDirty(element);
        console.log("isDirtyElement: ", isDirtyElement);
        console.log("wasDirtyElement: ", wasDirtyElement);
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let isNowDirtyRow = this.isDirtyRow(row);
            console.log("isNowDirtyRow: ", isNowDirtyRow);
            console.log("wasDirtyRow: ", wasDirtyRow);
            if (isNowDirtyRow != wasDirtyRow) {
                DOM.handleDirtyElement(row, isNowDirtyRow);
                let rows = this.getTableRecords(true);
                let existsDirtyRecord = rows.length > 0;
                console.log("dirty records:", rows);
                console.log("existsDirtyRecord:", existsDirtyRecord);
                this.toggleShowButtonsSaveCancel(existsDirtyRecord);
            }
        }
    }
    isDirtyRow(row) {
        throw new Error("Subclass of TableBasePage must implement method isDirtyRow().");
    }
    toggleShowButtonsSaveCancel(show, buttonSave = null, buttonCancel = null) {
        if (buttonSave == null) buttonSave = document.querySelector(idFormFilters + ' button.' + flagSave);
        if (buttonCancel == null) buttonCancel = document.querySelector(idFormFilters + ' button.' + flagCancel);
        if (show) {
            buttonCancel.classList.remove(flagCollapsed);
            buttonSave.classList.remove(flagCollapsed);
        } else {
            buttonCancel.classList.add(flagCollapsed);
            buttonSave.classList.add(flagCollapsed);
        }
    }
    handleChangeSelectCellTable(element) {
        let row = DOM.getRowFromElement(element);
        let td = DOM.getCellFromElement(element);
        console.log("td: ", td);
        let wasDirtyRow = this.isDirtyRow(row);
        let wasDirtyElement = element.classList.contains(flagDirty);
        let isDirtyElement = DOM.isElementDirty(element);
        console.log("isDirtyElement: ", isDirtyElement);
        console.log("wasDirtyElement: ", wasDirtyElement);
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let optionSelected = element.options[element.selectedIndex];
            td.setAttribute(attrIdAccessLevel, optionSelected.value);
            td.setAttribute(flagAccessLevelRequired, optionSelected.textcontent);
            let isNowDirtyRow = this.isDirtyRow(row);
            console.log("isNowDirtyRow: ", isNowDirtyRow);
            console.log("wasDirtyRow: ", wasDirtyRow);
            if (isNowDirtyRow != wasDirtyRow) {
                DOM.handleDirtyElement(row, isNowDirtyRow);
                let rows = this.getTableRecords(true);
                let existsDirtyRecord = rows.length > 0;
                console.log("dirty records:", rows);
                console.log("existsDirtyRecord:", existsDirtyRecord);
                this.toggleShowButtonsSaveCancel(existsDirtyRecord);
            }
        }
    }
    hookupTextareasNameTable() {
        let selectorName = idTableMain + ' tbody tr td.' + flagName + ' textarea';
        Events.initialiseEventHandler(selectorName, flagInitialised, (textareaName) => {
            textareaName.addEventListener("change", (event) => {
                console.log("textarea change event");
                this.handleChangeElementCellTable(textareaName);
            });
        });
    }
    hookupTextareasDescriptionTable() {
        let selectorDescription = idTableMain + ' tbody tr td.' + flagDescription + ' textarea';
        Events.initialiseEventHandler(selectorDescription, flagInitialised, (textareaDescription) => {
            textareaDescription.addEventListener("change", (event) => {
                console.log("textarea change event");
                this.handleChangeElementCellTable(textareaDescription);
            });
        });
    }
    hookupInputsActiveTable() {
        let selectorActive = idTableMain + ' tbody tr td.' + flagActive + ' input[type="checkbox"]';
        Events.initialiseEventHandler(selectorActive, flagInitialised, (inputActive) => {
            inputActive.addEventListener("change", (event) => {
                console.log("input change event");
                this.handleChangeElementCellTable(inputActive);
            });
        });
    }
    hookupTdsAccessLevel() {
        Events.initialiseEventHandler(idTableMain + ' tbody td.' + flagAccessLevel, flagInitialised, (tdAccessLevel) => {
            tdAccessLevel.addEventListener("click", (event) => { this.handleClickTdAccessLevel(event); } );
        });
    }
    handleClickTdAccessLevel(event) {
        console.log("tdAccessLevel clicked");
        event.stopPropagation();
        let tdAccessLevel = DOM.getCellFromElement(event.target);
        console.log("tdAccessLevel: ", tdAccessLevel);
        let row = DOM.getRowFromElement(tdAccessLevel);
        let idAccessLevelSelected = tdAccessLevel.querySelector('div.' + flagAccessLevel).getAttribute(attrIdAccessLevel);
        let ddlAccessLevel = document.createElement('select');
        ddlAccessLevel.classList.add(flagAccessLevel);
        ddlAccessLevel.setAttribute(attrValueCurrent, idAccessLevelSelected);
        ddlAccessLevel.setAttribute(attrValuePrevious, idAccessLevelSelected);
        optionsAccessLevel.forEach((accessLevel) => {
            let option = document.createElement('option');
            option.value = accessLevel.value;
            option.textContent = accessLevel.text;
            if (accessLevel.value == idAccessLevelSelected) option.selected = true;
            ddlAccessLevel.appendChild(option);
        });
        let tdAccessLevelNew = tdAccessLevel.cloneNode(true);
        tdAccessLevelNew.innerHTML = '';
        tdAccessLevelNew.appendChild(ddlAccessLevel);
        row.replaceChild(tdAccessLevelNew, tdAccessLevel);
        this.hookupDdlsAccessLevelTable();
    }
    hookupDdlsAccessLevelTable() {
        Events.initialiseEventHandler(idTableMain + ' tbody select.' + flagAccessLevel, flagInitialised, (ddlAccessLevel) => {
            ddlAccessLevel.addEventListener("change", (event) => {
                event.stopPropagation();
                this.handleChangeDdlAccessLevelTable(ddlAccessLevel);
            });
        });
    }
    handleChangeDdlAccessLevelTable(ddlAccessLevel) {
        let row = DOM.getRowFromElement(ddlAccessLevel);
        let td = DOM.getCellFromElement(ddlAccessLevel);
        console.log("td: ", td);
        let wasDirtyRow = this.isDirtyRow(row);
        let wasDirtyElement = ddlAccessLevel.classList.contains(flagDirty);
        let isDirtyElement = DOM.isElementDirty(ddlAccessLevel);
        console.log("isDirtyElement: ", isDirtyElement);
        console.log("wasDirtyElement: ", wasDirtyElement);
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let optionSelected = ddlAccessLevel.options[ddlAccessLevel.selectedIndex];
            td.setAttribute(attrIdAccessLevel, optionSelected.value);
            td.setAttribute(flagAccessLevelRequired, optionSelected.textcontent);
            let isNowDirtyRow = this.isDirtyRow(row);
            console.log("isNowDirtyRow: ", isNowDirtyRow);
            console.log("wasDirtyRow: ", wasDirtyRow);
            if (isNowDirtyRow != wasDirtyRow) {
                DOM.handleDirtyElement(row, isNowDirtyRow);
                let rows = this.getTableRecords(true);
                let existsDirtyRecord = rows.length > 0;
                console.log("dirty records:", rows);
                console.log("existsDirtyRecord:", existsDirtyRecord);
                this.toggleShowButtonsSaveCancel(existsDirtyRecord);
            }
        }
    }
    leave() {
        if (this.constructor === TableBasePage) {
            throw new Error("Must implement leave() method.");
        }
        super.leave();
        let formFilters = this.getFormFilters();
        let dataPage = {};
        dataPage[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        this.setLocalStoragePage(dataPage);
        _rowBlank = null;
    }
}


/*  Example of a subclass of TableBasePage 
import { TableBasePage } from "./page_table_base.js";
import API from "../api.js";
import DOM from "../dom.js";

export class PageStoreProductCategories extends TableBasePage {
    static hash = hashPageStoreProductCategories;
    callFilterTableContent = API.getCategoriesByFilters;

    constructor() {}
    initialize() {}
    hookupFilters() {}
    loadRowTable(rowJson) {}
    getJsonRow(row) {}
    hookupTableMain() {}
    isDirtyRow(row) {}
    leave() {}
}
*/