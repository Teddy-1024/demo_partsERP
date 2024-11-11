
import BusinessObjects from "../lib/business_objects/business_objects.js";
import Events from "../lib/events.js";
import LocalStorage from "../lib/local_storage.js";
import Validation from "../lib/validation.js";
import BasePage from "./base.js";
import API from "../api.js";
import DOM from "../dom.js";
import Utils from "../lib/utils.js";

import OverlayConfirm from "../components/common/temporary/overlay_confirm.js";
import OverlayError from "../components/common/temporary/overlay_error.js";

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
        this.getTableRecords();
        this.leave();
        */
        // this.cursorXInitial = null;
        this.cursorYInitial = null;
        this.rowInitial = null;
        this.placeholder = null;
        this.dragSrcEl = null;
        this.dragSrcRow = null;

        this.hookupTableCellDdls = this.hookupTableCellDdls.bind(this);
    }
    
    initialize(isPopState = false) {
        throw new Error("Must implement initialize() method.");
    }
    sharedInitialize(isPopState = false, isSinglePageApp = false) {
        if (!isPopState) {
            super.sharedInitialize();
            this.hookupFilters();
            this.hookupButtonsAddSaveCancel();
            this.hookupTableMain();
            OverlayConfirm.hookup(() => {
                if (isSinglePageApp) {
                    this.saveRecordsTableDirtySinglePageApp();
                }
                else {
                    this.saveRecordsTableDirty();
                }
            });
        } else {
            let dataPage = this.getLocalStoragePage();
            let filters = dataPage[flagFormFilters];
            let formFilters = this.getFormFilters();
            let filtersDefault = DOM.convertForm2JSON(formFilters);
            if (!Validation.areEqualDicts(filters, filtersDefault)) {
                this.callFilterTableContent(filters);
            }
        }
    }
    hookupFilters() {
        if (this.constructor === TableBasePage) {
            throw new Error("Subclass of TableBasePage must implement method hookupFilters().");
        }
    }
    sharedHookupFilters() {
        this.hookupButtonApplyFilters();
    }
    hookupFilterActive() {
        this.hookupFilter(flagActive);
    }
    hookupFilter(filterFlag, handler = (event, filter) => { return TableBasePage.isDirtyFilter(filter); }) {
        let filterSelector = idFormFilters + ' .' + filterFlag;
        this.hookupEventHandler("change", filterSelector, handler);
    }
    static isDirtyFilter(filter) {
        let isDirty = DOM.updateAndCheckIsElementDirty(filter);
        if (isDirty) {
            let tbody = document.querySelector(idTableMain + ' tbody');
            tbody.querySelectorAll('tr').remove();
            tbody.appendChild(document.createElement('<div>Press "Apply Filters" to refresh the table.</div>'));
        }
        return isDirty;
    }
    hookupFilterIsNotEmpty() {
        this.hookupFilter(flagIsNotEmpty);
    }
    hookupButtonApplyFilters() {
        this.hookupEventHandler("click", idButtonApplyFilters, (event, button) => {
            event.stopPropagation();
            this.getAndLoadFilteredTableContent();
        });
    }
    getAndLoadFilteredTableContent() {
        let formFilters = this.getFormFilters();
        let filtersJson = DOM.convertForm2JSON(formFilters);
        this.leave();
        this.callFilterTableContent(filtersJson)
            .catch(error => console.error('Error:', error));
    }
    getFormFilters() {
        return document.querySelector(idFormFilters);
    }
    callbackLoadTableContent(response) {
        let table = TableBasePage.getTableMain();
        let bodyTable = table.querySelector('tbody');
        bodyTable.querySelectorAll('tr').forEach(function(row) { row.remove(); });
        let rowsJson = response.data[flagRows];
        if (!Validation.isEmpty(rowsJson) && rowsJson.every(row => row.hasOwnProperty('display_order'))) {
            rowsJson = rowsJson.sort((a, b) => a.display_order - b.display_order);
        }
        rowsJson.forEach(this.loadRowTable.bind(this));
        this.hookupTableMain();
    }
    static getTableMain() {
        return document.querySelector(idTableMain);
    }
    loadRowTable(rowJson) {
        throw new Error("Subclass of TableBasePage must implement method loadRowTable().");
    }
    getAndLoadFilteredTableContentSinglePageApp() {
        let formFilters = this.getFormFilters();
        let filtersJson = DOM.convertForm2JSON(formFilters);
        this.callFilterTableContent(filtersJson)
            .then(data => {
                if (_verbose) { console.log('Table data received:', data); }
                this.callbackLoadTableContent(data);
            })
            .catch(error => console.error('Error:', error));
    }
    hookupButtonsAddSaveCancel() {
        this.hookupButtonSave();
        this.hookupButtonCancel();
        this.toggleShowButtonsSaveCancel(false);
    }
    saveRecordsTableDirty() {
        let records = this.getTableRecords(true);
        if (records.length == 0) {
            OverlayError.show('No records to save');
            return;
        }
        let formElement = this.getFormFilters();
        let comment = DOM.getElementValueCurrent(document.querySelector(idTextareaConfirm));
        this.callSaveTableContent(records, formElement, comment)
            .then(data => {
                if (data[flagStatus] == flagSuccess) {
                    if (_verbose) { 
                        console.log('Records saved!');
                        console.log('Data received:', data);
                    }
                    this.getAndLoadFilteredTableContent();
                }
                else {
                    if (_verbose) { console.log("error: ", data[flagMessage]); }
                    OverlayError.show(data[flagMessage]);
                }
            })
            .catch(error => console.error('Error:', error));
    }
    getTableRecords(dirtyOnly = false) {
        // let table = TableBasePage.getTableMain();
        let records = [];
        let record;
        document.querySelectorAll(idTableMain + ' > tbody > tr').forEach((row) => {
            if (dirtyOnly && !DOM.hasDirtyChildrenContainer(row)) return;
            record = this.getJsonRow(row);
            records.push(record);
        });
        return records;
    }
    getJsonRow(row) {
        throw new Error("Subclass of TableBasePage must implement method getJsonRow().");
    }
    saveRecordsTableDirtySinglePageApp() {
        let records = this.getTableRecords(true);
        if (records.length == 0) {
            OverlayError.show('No records to save');
            return;
        }
        let formElement = this.getFormFilters();
        let comment = DOM.getElementValueCurrent(document.querySelector(idTextareaConfirm));
        this.callSaveTableContent(records, formElement, comment)
            .then(data => {
                if (data[flagStatus] == flagSuccess) {
                    if (_verbose) { 
                        console.log('Records saved!');
                        console.log('Data received:', data);
                    }
                    this.callbackLoadTableContent(data);
                }
                else {
                    if (_verbose) { console.log("error: ", data[flagMessage]); }
                    OverlayError.show(data[flagMessage]);
                }
            })
            .catch(error => console.error('Error:', error));
    }
    hookupButtonCancel() {
        Events.initialiseEventHandler(idFormFilters + ' button.' + flagCancel, flagInitialised, function(button) {
            button.addEventListener("click", function(event) {
                event.stopPropagation();
                this.getAndLoadFilteredTableContent();
            });
            button.classList.add(flagCollapsed);
        });
    }
    handleClickAddRowTable(event, button) {
        event.stopPropagation();
        _rowBlank.setAttribute(this.constructor.attrIdRowObject, -1 - _rowBlank.getAttribute(this.constructor.attrIdRowObject));
        let tbody = document.querySelector(idTableMain + ' tbody');
        let row = _rowBlank.cloneNode(true);
        row.classList.remove(flagInitialised);
        row.querySelectorAll('.' + flagInitialised).forEach(function(element) {
            element.classList.remove(flagInitialised);
        });
        let countRows = document.querySelectorAll(idTableMain + ' > tbody > tr').length;
        row.setAttribute(this.constructor.attrIdRowObject, -1 - countRows);
        this.initialiseRowNew(row);
        tbody.appendChild(row);
        this.hookupTableMain();
    }
    initialiseRowNew(row) {
        if (this.constructor === TableBasePage) {
            throw new Error("Subclass of TableBasePage must implement method initialiseRowNew().");
        }
        row.classList.remove(flagRowNew);
    }
    hookupTableMain() {
        if (this.constructor === TableBasePage) {
            throw new Error("Must implement hookupTableMain() method.");
        }
        if (true) { // _rowBlank == null) {
            Events.initialiseEventHandler(idTableMain, flagInitialised, (table) => {
               this.cacheRowBlank();
            });
        }
    }
    cacheRowBlank() {
        let selectorRowNew = idTableMain + ' tbody tr.' + flagRowNew;
        let rowBlankTemp = document.querySelector(selectorRowNew);
        if (_verbose) { console.log("row blank temp: ", rowBlankTemp); }
        let countRows = document.querySelectorAll(idTableMain + ' > tbody > tr').length;
        _rowBlank = rowBlankTemp.cloneNode(true);
        document.querySelectorAll(selectorRowNew).forEach(function(row) {
            row.remove();
        });
        _rowBlank.setAttribute(this.constructor.attrIdRowObject, -1 - countRows);
    }
    hookupSlidersDisplayOrderTable() {
        let selectorDisplayOrder = idTableMain + ' tbody tr td.' + flagDisplayOrder + ' input.' + flagSlider + '.' + flagDisplayOrder;
        /*
        Events.initialiseEventHandler(selectorDisplayOrder, flagInitialised, (sliderDisplayOrder) => {
            /*
            sliderDisplayOrder.setAttribute('draggable', true);
            sliderDisplayOrder.addEventListener('dragstart', this.handleDragSliderStart.bind(this), false);
            sliderDisplayOrder.addEventListener('dragenter', this.handleDragSliderEnter.bind(this), false);
            sliderDisplayOrder.addEventListener('dragover', this.handleDragSliderOver.bind(this), false);
            sliderDisplayOrder.addEventListener('dragleave', this.handleDragSliderLeave.bind(this), false);
            sliderDisplayOrder.addEventListener('drop', this.handleDropSlider.bind(this), false);
            sliderDisplayOrder.addEventListener('dragend', this.handleDragSliderEnd.bind(this), false);
            *
            sliderDisplayOrder.addEventListener('change', (event) => {
                console.log("slider change event");
                this.handleChangeNestedElementCellTable(sliderDisplayOrder);
            });
        });
        */
        this.hookupChangeHandlerTableCells(selectorDisplayOrder);
    }
    hookupChangeHandlerTableCells(inputSelector, handler = (event, element) => { this.handleChangeNestedElementCellTable(event, element); }) {
        Events.initialiseEventHandler(inputSelector, flagInitialised, (input) => {
            input.addEventListener("change", (event) => {
                handler(event, input);
            });
            handler(null, input);
        });
        // this.hookupEventHandler("change", inputSelector, handler);
    }
    /*
    handleChangeElementCellTable(event, element) {
        let row = DOM.getRowFromElement(element);
        let td = DOM.getCellFromElement(element);
        let wasDirtyRow = DOM.hasDirtyChildrenContainer(row);
        let wasDirtyElement = element.classList.contains(flagDirty);
        let isDirtyElement = DOM.updateAndCheckIsElementDirty(element);
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let isNowDirtyRow = DOM.hasDirtyChildrenContainer(row);
            if (isNowDirtyRow != wasDirtyRow) {
                DOM.handleDirtyElement(row, isNowDirtyRow);
                let rows = this.getTableRecords(true);
                let existsDirtyRecord = rows.length > 0;
                this.toggleShowButtonsSaveCancel(existsDirtyRecord);
            }
        }
    }
    handleChangeElementNestedCellTable(event, element, flagColumnList = [], orderNesting = 1) {
        let orderNestingTemp = orderNesting;
        let row, td, nestedRowSelector;
        while (orderNestingTemp > 0) {
            nestedRowSelector = idTableMain;
            for (let indexOrderNesting = 0; indexOrderNesting < orderNestingTemp; indexOrderNesting++) {
                nestedRowSelector += ' tbody tr';
            }
            row = DOM.getClosestParent(element, nestedRowSelector);
            td = row.querySelector('td.' + flag);
        }
        let row = DOM.getRowFromElement(element);
        let td = DOM.getCellFromElement(element);
        let wasDirtyRow = DOM.hasDirtyChildrenContainer(row);
        let wasDirtyElement = element.classList.contains(flagDirty);
        let isDirtyElement = DOM.updateAndCheckIsElementDirty(element);
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let isNowDirtyRow = DOM.hasDirtyChildrenContainer(row);
            if (isNowDirtyRow != wasDirtyRow) {
                DOM.handleDirtyElement(row, isNowDirtyRow);
                let rows = this.getTableRecords(true);
                let existsDirtyRecord = rows.length > 0;
                this.toggleShowButtonsSaveCancel(existsDirtyRecord);
            }
        }
    }
    handleChangeElementSubtableCell(event, element, flagFieldSubtable) {
        let rowSubtable = element.closest(idTableMain + ' td.' + flagFieldSubtable + ' tbody tr');
        let rowTable = rowSubtable.closest(idTableMain + ' > tbody > tr');
        let td = DOM.getCellFromElement(element);
        // let tdSubtable = td.closest('td.' + flagFieldSubtable);
        let wasDirtyRowSubtable = DOM.hasDirtyChildrenContainer(rowSubtable);
        let wasDirtyRowTable = DOM.hasDirtyChildrenContainer(rowTable);
        let wasDirtyElement = element.classList.contains(flagDirty);
        let isDirtyElement = DOM.updateAndCheckIsElementDirty(element);
        console.log({isDirtyElement, wasDirtyElement});
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let isNowDirtyRowSubtable = DOM.hasDirtyChildrenContainer(rowSubtable);
            console.log({isNowDirtyRowSubtable, wasDirtyRowSubtable});
            if (isNowDirtyRowSubtable != wasDirtyRowSubtable) {
                DOM.handleDirtyElement(rowSubtable, isNowDirtyRowSubtable);
                let isNowDirtyRowTable = DOM.hasDirtyChildrenContainer(rowTable);
                console.log({isNowDirtyRowTable, wasDirtyRowTable});
                if (isNowDirtyRowTable != wasDirtyRowTable) {
                    DOM.handleDirtyElement(rowTable, isNowDirtyRowTable);
                    let rows = this.getTableRecords(true);
                    let existsDirtyRecord = rows.length > 0;
                    this.toggleShowButtonsSaveCancel(existsDirtyRecord);
                }
            }
        }
    }
    */
    handleChangeNestedElementCellTable(event, element) {
        let wasDirtyParentRows = this.getAllIsDirtyRowsInParentTree(element);
        let wasDirtyElement = DOM.isElementDirty(element);
        let isDirtyElement = DOM.updateAndCheckIsElementDirty(element);
        if (_verbose) { console.log({isDirtyElement, wasDirtyElement, wasDirtyParentRows}); }
        if (isDirtyElement != wasDirtyElement) {
            let td = DOM.getCellFromElement(element);
            DOM.setElementAttributeValueCurrent(td, DOM.getElementAttributeValueCurrent(element));
            DOM.handleDirtyElement(td, isDirtyElement);
            this.updateAndToggleShowButtonsSaveCancel();
            this.cascadeChangedIsDirtyNestedElementCellTable(element, isDirtyElement, wasDirtyParentRows);
        }
    }
    getAllIsDirtyRowsInParentTree(element) {
        let rows = [];
        let parent = element;
        let isDirty;
        while (parent) {
            if (parent.matches('tr')) {
                isDirty = parent.classList.contains(flagDirty)
                rows.push(isDirty);
            }
            parent = parent.parentElement;
        }
        return rows;
    }
    cascadeChangedIsDirtyNestedElementCellTable(element, isDirtyElement, wasDirtyParentRows) {
        if (Validation.isEmpty(wasDirtyParentRows)) return;
        let td = DOM.getCellFromElement(element);
        let isDirtyTd = isDirtyElement || DOM.hasDirtyChildrenContainer(tr);
        DOM.handleDirtyElement(td, isDirtyTd);
        let tr = DOM.getRowFromElement(td);
        let isDirtyRow = isDirtyTd || DOM.hasDirtyChildrenContainer(tr);
        let wasDirtyRow = wasDirtyParentRows.shift();
        if (_verbose) { console.log({isDirtyRow, wasDirtyRow}); }
        if (isDirtyRow != wasDirtyRow) {
            DOM.handleDirtyElement(tr, isDirtyRow);
            this.updateAndToggleShowButtonsSaveCancel();
            this.cascadeChangedIsDirtyNestedElementCellTable(tr.parentElement, isDirtyRow, wasDirtyParentRows);
        }
    }
    hookupChangeHandlerTableCellsWhenNotCollapsed(inputSelector, handler = (event, element) => {
        if (!element.classList.contains(flagCollapsed)) this.handleChangeNestedElementCellTable(event, element);
    }) {
        this.hookupEventHandler("change", inputSelector, handler);
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
        let table = TableBasePage.getTableMain();
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
        this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagCode + ' textarea');
    }
    hookupTextareasNameTable() {
        this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagName + ' textarea');
    }
    hookupTextareasDescriptionTable() {
        this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagDescription + ' textarea');
    }
    hookupFieldsActive(flagTable = '', handleClickRowNew = (event, element) => { this.handleClickAddRowTable(event, element); }) {
        let selectorButton = 'table' + (Validation.isEmpty(flagTable) ? '' : '.' + flagTable) + ' > tbody > tr > td.' + flagActive + ' button';
        let selectorButtonDelete = selectorButton + '.' + flagDelete;
        let selectorButtonUndelete = selectorButton + ':not(.' + flagDelete + ')';
        console.log("hookupFieldsActive: ", selectorButtonDelete, selectorButtonUndelete);
        this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete);
        this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete);
        this.hookupEventHandler(
            "click"
            , 'table' + (Validation.isEmpty(flagTable) ? '' : '.' + flagTable) + ' > thead > tr > th.' + flagActive + ' button'
            , (event, button) => { handleClickRowNew(event, button); }
        );
    }
    hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete) {
        this.hookupEventHandler("click", selectorButtonDelete, (event, element) => {
            this.handleClickButtonRowDelete(event, element, selectorButtonDelete, selectorButtonUndelete);
        });
    }
    handleClickButtonRowDelete(event, element, selectorButtonDelete, selectorButtonUndelete) {
        let row = DOM.getRowFromElement(element);
        // row.classList.add(flagDelete);
        if (row.classList.contains(flagRowNew) && !DOM.hasDirtyChildrenContainer(row)) {
            row.parentNode.removeChild(row);
        }
        let buttonAdd = element.cloneNode(false); // document.createElement("button");
        buttonAdd.classList.remove(flagInitialised);
        buttonAdd.classList.remove(flagDelete);
        buttonAdd.classList.add(flagAdd);
        buttonAdd.textContent = '+';
        // DOM.setElementAttributeValueCurrent(buttonAdd, false);
        element.replaceWith(buttonAdd);
        this.handleChangeNestedElementCellTable(null, buttonAdd);
        this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete);
        this.updateAndToggleShowButtonsSaveCancel();
    }
    hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete) {
        this.hookupEventHandler("click", selectorButtonUndelete, (event, element) => {
            this.handleClickButtonRowUndelete(event, element, selectorButtonDelete, selectorButtonUndelete);
        });
    }
    handleClickButtonRowUndelete(event, element, selectorButtonDelete, selectorButtonUndelete) {
        // let row = DOM.getRowFromElement(element);
        // row.classList.remove(flagDelete);
        let buttonDelete = element.cloneNode(false); // document.createElement("button");
        buttonDelete.classList.remove(flagInitialised);
        buttonDelete.classList.remove(flagAdd);
        buttonDelete.classList.add(flagDelete);
        buttonDelete.textContent = 'x';
        // DOM.setElementAttributeValueCurrent(buttonDelete, true);
        element.replaceWith(buttonDelete);
        this.handleChangeNestedElementCellTable(null, buttonDelete);
        this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete);
        this.updateAndToggleShowButtonsSaveCancel();
    }
    hookupTdsAccessLevel() {
        let cellSelector = idTableMain + ' tbody td.' + flagAccessLevel;
        this.hookupTableCellDdlPreviews(cellSelector, Utils.getListFromDict(accessLevels));
    }
    hookupTableCellDdlPreviews(
        cellSelector
        , optionList
        , ddlHookup = (cellSelector) => { this.hookupTableCellDdls(cellSelector); }
        , changeHandler = (event, element) => { this.handleChangeNestedElementCellTable(event, element); }
    ) {
        this.hookupEventHandler("click", cellSelector, (event, td) => {
            this.handleClickTableCellDdlPreview(
                event
                , td
                , optionList
                , cellSelector
                , (cellSelector) => { ddlHookup(
                    cellSelector
                    , (event, element) => { changeHandler(event, element); }
                ); }
            );
        });
        ddlHookup(cellSelector + ' select');
    }
    hookupTableCellDdls(ddlSelector, changeHandler = (event, element) => { this.handleChangeNestedElementCellTable(event, element); }) {
        this.hookupEventHandler("change", ddlSelector, (event, element) => { changeHandler(event, element); });
    }
    handleClickTableCellDdlPreview(event, td, optionObjectList, cellSelector, ddlHookup = (cellSelector) => { this.hookupTableCellDdls(cellSelector); }) {
        if (td.querySelector('select')) return;
        // td.removeEventListener("click", ddlHookup);
        let tdNew = td.cloneNode(true);
        td.parentNode.replaceChild(tdNew, td);
        let idSelected = DOM.getElementAttributeValueCurrent(tdNew);
        tdNew.innerHTML = '';
        let ddl = document.createElement('select');
        DOM.setElementValuesCurrentAndPrevious(ddl, idSelected);
        let optionJson, option;
        if (_verbose) { 
            console.log("click table cell ddl preview");
            console.log({optionObjectList, cellSelector});
        }
        option = DOM.createOption(null);
        ddl.appendChild(option);
        optionObjectList.forEach((optionObjectJson) => {
            optionJson = BusinessObjects.getOptionJsonFromObjectJson(optionObjectJson, idSelected);
            option = DOM.createOption(optionJson);
            ddl.appendChild(option);
        });
        tdNew.appendChild(ddl);
        let ddlSelector = cellSelector + ' select';
        debugger;
        ddlHookup(ddlSelector);
    }
    /*
    handleChangeTableCellDdl(event, ddl) {
        let row = DOM.getRowFromElement(ddl);
        let td = DOM.getCellFromElement(ddl);
        console.log("td: ", td);
        let wasDirtyRow = DOM.hasDirtyChildrenContainer(row);
        let wasDirtyElement = ddl.classList.contains(flagDirty);
        let isDirtyElement = DOM.updateAndCheckIsElementDirty(ddl);
        console.log("isDirtyElement: ", isDirtyElement);
        console.log("wasDirtyElement: ", wasDirtyElement);
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let optionSelected = ddl.options[ddl.selectedIndex];
            DOM.setElementAttributeValueCurrent(td, optionSelected.value);
            let isNowDirtyRow = DOM.hasDirtyChildrenContainer(row);
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
    */
    hookupTableCellDDlPreviewsWhenNotCollapsed(cellSelector, optionList, ddlHookup = (event, element) => { this.hookupTableCellDdls(event, element); }) {
        this.hookupEventHandler("click", cellSelector, (event, td) => {
            let div = td.querySelector('div');
            if (!div || div.classList.contains(flagCollapsed)) return;
            this.handleClickTableCellDdlPreview(event, td, optionList, cellSelector, (event, element) => { ddlHookup(event, element); });
        });
    }
    hookupProductCategoryDdls(ddlSelector) {
        this.hookupChangeHandlerTableCells(ddlSelector, (event, element) => { this.handleChangeProductCategoryDdl(event, element); });
    }
    handleChangeProductCategoryDdl(event, ddlCategory) {
        this.handleChangeNestedElementCellTable(event, ddlCategory);
        let idProductCategorySelected = DOM.getElementValueCurrent(ddlCategory);
        let row = DOM.getRowFromElement(ddlCategory);
        let tdProduct = row.querySelector('td.' + flagProduct);
        tdProduct.dispatchEvent(new Event('click'));
        let ddlProduct = row.querySelector('td.' + flagProduct + ' select');
        ddlProduct.innerHTML = '';
        ddlProduct.appendChild(DOM.createOption(null));
        let optionJson, option;
        Utils.getListFromDict(products).forEach((product) => {
            if (idProductCategorySelected != '0' && product[attrIdProductCategory] != idProductCategorySelected) return;
            optionJson = BusinessObjects.getOptionJsonFromObjectJson(product);
            option = DOM.createOption(optionJson);
            ddlProduct.appendChild(option);
        });
        this.handleChangeNestedElementCellTable(event, ddlProduct);
    }
    hookupFieldsProductPermutationVariation() {
        this.hookupPreviewsProductPermutationVariation();
        this.hookupDdlsProductPermutationVariation();
        this.hookupDdlsProductPermutationVariationType();
        this.hookupButtonsProductPermutationVariationAddDelete(); 
    }
    hookupPreviewsProductPermutationVariation() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagProductVariations, (event, element) => this.handleClickProductPermutationVariationsPreview(event, element));
    }
    handleClickProductPermutationVariationsPreview(event, element) {
        let tblVariations = element.querySelector('table.' + flagProductVariations);
        if (!Validation.isEmpty(tblVariations)) return;
        this.toggleColumnCollapsed(flagProductVariations, false);
        let permutationVariations = this.getElementProductVariations(element);
        tblVariations = document.createElement("table");
        tblVariations.classList.add(flagProductVariations);
        let thead = document.createElement("thead");
        let tr = document.createElement("tr");
        let thVariationType = document.createElement("th");
        thVariationType.classList.add(flagProductVariationType);
        thVariationType.textContent = 'Type';
        let thNameVariation = document.createElement("th");
        thNameVariation.classList.add(flagProductVariation);
        thNameVariation.textContent = 'Name';
        let buttonAdd = document.createElement("button");
        buttonAdd.classList.add(flagAdd);
        buttonAdd.textContent = '+';
        let thAddDelete = document.createElement("th");
        thAddDelete.classList.add(flagAdd);
        thAddDelete.appendChild(buttonAdd);
        tr.appendChild(thVariationType);
        tr.appendChild(thNameVariation);
        tr.appendChild(thAddDelete);
        thead.appendChild(tr);
        tblVariations.appendChild(thead);
        let tbody = document.createElement("tbody");
        if (!Validation.isEmpty(permutationVariations)) {
            permutationVariations.forEach((permutationVariation, index) => {
                this.addProductPermutationVariationRow(tbody, permutationVariation);
            });
        }
        tblVariations.appendChild(tbody);
        if (_verbose) { 
            console.log("click product permutation variations preview");
            console.log('variations:', permutationVariations);
            console.log("tblVariations: ", tblVariations);
        }

        let cellParent = element.closest(idTableMain + ' tbody tr td.' + flagProductVariations);
        cellParent.innerHTML = '';
        cellParent.appendChild(tblVariations);
        
        this.hookupFieldsProductPermutationVariation();
    }
    toggleColumnCollapsed(flagColumn, isCollapsed) {
        this.toggleColumnHasClassnameFlag(flagColumn, isCollapsed, flagCollapsed);
    }
    toggleColumnHeaderCollapsed(flagColumn, isCollapsed) {
        this.toggleColumnHasClassnameFlag(flagColumn, isCollapsed, flagCollapsed);
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
                    if (_verbose) { console.log("parts: ", parts); }
                    new_variation_type = productVariationTypes[parts[0].trim()];
                    new_variation = productVariations[parts[1].trim()];
                    objVariations.push({
                        [flagProductVariationType]: new_variation_type,
                        [flagProductVariation]: new_variation,
                    });
                }
                else {
                    if (_verbose) { console.log("error: invalid variation: ", variation); }
                }
            });
        }
        return objVariations;
    }
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
    addProductPermutationVariationRow(tbody, permutationVariation) {
        if (_verbose) { console.log("permutationVariation: ", permutationVariation); }
        let productVariationType, optionProductVariationTypeJson, optionProductVariationType, productVariation, optionProductVariationJson, optionProductVariation;
        /*
        if (Validation.isEmpty(variations)) {
            return;
        }
        */
        let productVariationKeys = Object.keys(productVariations);
        let productVariationTypeKeys = Object.keys(productVariationTypes);
        
        let ddlsProductVariationType = tbody.querySelectorAll('select.' + flagProductVariationType);
        let productVariationTypeKeysSelected = new Set();
        let valueSelected;
        let doFilterProductVariationKeys = permutationVariation[attrIdProductVariationType] != 0;
        ddlsProductVariationType.forEach((ddlProductVariationType) => {
            valueSelected = DOM.getElementValueCurrent(ddlProductVariationType);
            productVariationTypeKeysSelected.add(valueSelected);
        });
        productVariationTypeKeys = productVariationTypeKeys.filter(typeKey => !productVariationTypeKeysSelected.has(typeKey));
        if (productVariationTypeKeys.length == 0) return;
        if (doFilterProductVariationKeys) {
            productVariationKeys = productVariationKeys.filter(variationKey => !productVariationTypeKeysSelected.has(productVariations[variationKey][attrIdProductVariationType]));
        }
        
        let permutationVariationJson = permutationVariation[flagProductVariation];
        let permutationVariationTypeJson = permutationVariation[flagProductVariationType];
        
        let tdVariationType = document.createElement("td");
        tdVariationType.classList.add(flagProductVariationType);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdVariationType, permutationVariationTypeJson[attrIdProductVariationType]);
        
        let ddlVariationType = document.createElement("select");
        ddlVariationType.classList.add(flagProductVariationType);
        DOM.setElementAttributesValuesCurrentAndPrevious(ddlVariationType, permutationVariationTypeJson[attrIdProductVariationType]);
        
        optionProductVariationType = DOM.createOption(null);
        if (_verbose) { console.log("optionProductVariationType: ", optionProductVariationType); }
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
            if (_verbose) { console.log("optionProductVariationType: ", optionProductVariationType); }
            ddlVariationType.appendChild(optionProductVariationType);
        });
        
        let tdVariation = document.createElement("td");
        tdVariation.classList.add(flagProductVariation);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdVariation, permutationVariationJson[attrIdProductVariation]);

        let ddlVariation = document.createElement("select");
        ddlVariation.classList.add(flagProductVariation);
        DOM.setElementAttributesValuesCurrentAndPrevious(ddlVariation, permutationVariationJson[attrIdProductVariation]);
        
        optionProductVariation = DOM.createOption(null);
        if (_verbose) { console.log("optionProductVariation: ", optionProductVariation); }
        ddlVariation.appendChild(optionProductVariation);

        productVariationKeys.forEach((productVariationKey) => {
            productVariation = productVariations[productVariationKey];
            optionProductVariationJson = BusinessObjects.getOptionJsonFromObjectJson(productVariation, permutationVariationJson[attrIdProductVariation]);
            optionProductVariation = DOM.createOption(optionProductVariationJson);
            if (_verbose) { console.log("optionProductVariation: ", optionProductVariation); }
            ddlVariation.appendChild(optionProductVariation);
        });
        
        let tdDelete = document.createElement("td");
        tdDelete.classList.add(flagDelete);
        
        let buttonDelete = document.createElement("button");
        buttonDelete.classList.add(flagDelete);
        buttonDelete.textContent = 'x';

        let tr = document.createElement("tr");
        tr.classList.add(flagProductVariation);
        tdVariationType.appendChild(ddlVariationType);
        tr.appendChild(tdVariationType);
        tdVariation.appendChild(ddlVariation);
        tr.appendChild(tdVariation);
        tdDelete.appendChild(buttonDelete);
        tr.appendChild(tdDelete);
        tbody.appendChild(tr);
    }
    hookupDdlsProductPermutationVariation() {
        this.hookupTableCellDdls(idTableMain + ' td.' + flagProductVariations + ' td.' + flagProductVariation);
    }
    hookupDdlsProductPermutationVariationType() {
        this.hookupTableCellDdls(idTableMain + ' td.' + flagProductVariations + ' td.' + flagProductVariationType);
    }
    hookupButtonsProductPermutationVariationAddDelete() {
        let selectorButton = idTableMain + ' td.' + flagProductVariations + ' tr.' + flagProductVariation + ' button';
        let selectorButtonDelete = selectorButton + '.' + flagDelete;
        let selectorButtonUndelete = selectorButton + '.' + flagAdd;
        this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete, (event, element) => {
            this.handleClickButtonRowDelete(event, element);
            this.updateProductPermutationVariations(element);
        });
        this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete);
        this.hookupButtonsProductPermutationVariationAdd();
    }
    hookupButtonsProductPermutationVariationAdd() {
        this.hookupEventHandler(
            "click"
            , idTableMain + ' td.' + flagProductVariations + ' button.' + flagAdd
            , (event, element) => { this.handleClickButtonProductPermutationVariationAdd(event, element); }
        );
    }
    handleClickButtonProductPermutationVariationAdd(event, element) {
        let variationsCell = element.closest('td.' + flagProductVariations);
        let tbody = variationsCell.querySelector('tbody');
        let permutationVariation = TableBasePage.createOptionUnselectedProductVariation();
        this.addProductPermutationVariationRow(tbody, permutationVariation);
        this.hookupFieldsProductPermutationVariation();
    }
    updateProductPermutationVariations(element) {
        let variationsCell = element.closest('td.' + flagProductVariations);
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
    
    hookupCurrencyFields() {
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagCurrency, Utils.getListFromDict(currencies));
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
        // _rowBlank = null;
    }

    toggleColumnHasClassnameFlag(columnFlag, isRequiredFlag, classnameFlag) {
        let table = TableBasePage.getTableMain();
        let columnTh = table.querySelector('th.' + columnFlag);
        let columnThHasFlag = columnTh.classList.contains(classnameFlag);
        if (isRequiredFlag == columnThHasFlag) return;
        DOM.toggleElementHasClassnameFlag(columnTh, isRequiredFlag, classnameFlag);
        /*
        let columnTds = table.querySelectorAll('td.' + columnFlag);
        columnTds.forEach((columnTd) => {
            DOM.toggleElementHasClassnameFlag(columnTd, isRequiredFlag, classnameFlag);
        });
        */
    }
    toggleColumnHeaderHasClassnameFlag(columnFlag, isRequiredFlag, classnameFlag) {
        let table = TableBasePage.getTableMain();
        let columnTh = table.querySelector('th.' + columnFlag);
        DOM.toggleElementHasClassnameFlag(columnTh, isRequiredFlag, classnameFlag);
    }

    updateAndToggleShowButtonsSaveCancel() {
        let records = this.getTableRecords(true);
        let existsDirtyRecord = records.length > 0;
        this.toggleShowButtonsSaveCancel(existsDirtyRecord);
    }
}


/*  Example of a subclass of TableBasePage 
import { TableBasePage } from "./page_table_base.js";
import API from "../api.js";
import DOM from "../dom.js";

export class PageStoreProductCategories extends TableBasePage {
    static hash = hashPageStoreProductCategories;
    static attrIdRowObject = attrIdProductCategory;
    callFilterTableContent = API.getCategoriesByFilters;
    callSaveTableContent = API.saveCategories;

    constructor() {}
    initialize() {}
    hookupFilters() {}
    loadRowTable(rowJson) {}
    getJsonRow(row) {}
    initialiseRowNew(row) {}
    hookupTableMain() {}
    isDirtyRow(row) {}
    leave() {}
}
*/