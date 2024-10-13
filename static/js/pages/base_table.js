
import BusinessObjects from "../lib/business_objects.js";
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
    getAndLoadFilteredTableContentSinglePageApp() {
        let formFilters = this.getFormFilters();
        let filtersJson = DOM.convertForm2JSON(formFilters);
        this.callFilterTableContent(filtersJson)
            .then(data => {
                console.log('Table data received:', data);
                this.callbackLoadTableContent(data);
            })
            .catch(error => console.error('Error:', error));
    }
    hookupButtonsAddSaveCancel() {
        this.hookupButtonAddRowTable();
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
                    console.log('Records saved!');
                    console.log('Data received:', data);
                    this.getAndLoadFilteredTableContent();
                }
                else {
                    console.log("error: ", data[flagMessage]);
                    OverlayError.show(data[flagMessage]);
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
                    console.log('Records saved!');
                    console.log('Data received:', data);
                    this.callbackLoadTableContent(data);
                }
                else {
                    console.log("error: ", data[flagMessage]);
                    OverlayError.show(data[flagMessage]);
                }
            })
            .catch(error => console.error('Error:', error));
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
        this.hookupEventHandler("click", idFormFilters + ' button.' + flagAdd, (event, button) => {
            event.stopPropagation();
            let tbody = document.querySelector(idTableMain + ' tbody');
            let row = _rowBlank.cloneNode(true);
            row.classList.remove(flagInitialised);
            row.querySelectorAll('.' + flagInitialised).forEach(function(element) {
                element.classList.remove(flagInitialised);
            });
            /* Shared nethods
            let newDisplayOrder = parseInt(tbody.querySelector('tr:last-child').querySelector('td.' + flagDisplayOrder + ' .' + flagSlider).getAttribute(attrValueCurrent)) + 1;
            let slider = tbody.querySelector('tr:last-child').querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
            if (slider) {
                slider.setAttribute(attrValueCurrent, newDisplayOrder);
                slider.setAttribute(attrValuePrevious, newDisplayOrder);
            }
            */
            this.initialiseRowNew(row);
            tbody.appendChild(row);
            this.hookupTableMain();
        });
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
        console.log("row blank temp: ", rowBlankTemp);
        _rowBlank = rowBlankTemp.cloneNode(true);
        document.querySelectorAll(selectorRowNew).forEach(function(row) {
            row.remove();
        });
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
                this.handleChangeElementCellTable(sliderDisplayOrder);
            });
        });
        */
        this.hookupChangeHandlerTableCells(selectorDisplayOrder);
    }
    hookupChangeHandlerTableCells(inputSelector, handler = (event, element) => { this.handleChangeElementCellTable(event, element); }) {
        Events.initialiseEventHandler(inputSelector, flagInitialised, (input) => {
            input.addEventListener("change", (event) => {
                handler(event, input);
            });
            this.handleChangeElementCellTable(null, input);
        });
        // this.hookupEventHandler("change", inputSelector, handler);
    }
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
    hookupChangeHandlerTableCellsWhenNotCollapsed(inputSelector, handler = (event, element) => {
        if (!element.classList.contains(flagCollapsed)) this.handleChangeElementCellTable(event, element);
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
        this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagCode + ' textarea');
    }
    hookupTextareasNameTable() {
        this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagName + ' textarea');
    }
    hookupTextareasDescriptionTable() {
        this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagDescription + ' textarea');
    }
    hookupInputsActiveTable() {
        this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagActive + ' input[type="checkbox"]');
    }
    hookupTdsAccessLevel() {
        let cellSelector = idTableMain + ' tbody td.' + flagAccessLevel;
        this.hookupTableCellDdlPreviews(cellSelector, Utils.getListFromDict(accessLevels));
    }
    hookupTableCellDdlPreviews(cellSelector, optionList, ddlHookup = (event, element) => { this.hookupTableCellDdls(event, element); }) {
        this.hookupEventHandler("click", cellSelector, (event, td) => {
            // if (td.querySelector('select')) return;
            this.handleClickTableCellDdlPreview(event, td, optionList, cellSelector, (event, element) => { ddlHookup(event, element); });
        });
    }
    hookupTableCellDdls(ddlSelector) {
        this.hookupEventHandler("change", ddlSelector, (event, element) => { this.handleChangeTableCellDdl(event, element); });
    }
    handleClickTableCellDdlPreview(event, td, optionObjectList, cellSelector, ddlHookup = (event, element) => { this.hookupTableCellDdls(event, element); }) {
        if (td.querySelector('select')) return;
        // td.removeEventListener("click", ddlHookup);
        console.log("click table cell ddl preview");
        let tdNew = td.cloneNode(true);
        td.parentNode.replaceChild(tdNew, td);
        let idSelected = tdNew.getAttribute(attrValueCurrent);
        tdNew.innerHTML = '';
        let ddl = document.createElement('select');
        DOM.setElementValuesCurrentAndPrevious(ddl, DOM.getElementAttributeValueCurrent(tdNew));
        let optionJson, option;
        console.log({optionObjectList, cellSelector});
        optionObjectList.forEach((optionObjectJson) => {
            optionJson = BusinessObjects.getOptionJsonFromObjectJson(optionObjectJson, idSelected);
            option = DOM.createOption(optionJson);
            ddl.appendChild(option);
        });
        tdNew.appendChild(ddl);
        let ddlSelector = cellSelector + ' select';
        ddlHookup(ddlSelector);
    }
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
    hookupTableCellDDlPreviewsWhenNotCollapsed(cellSelector, optionList, ddlHookup = (event, element) => { this.hookupTableCellDdls(event, element); }) {
        this.hookupEventHandler("click", cellSelector, (event, td) => {
            let div = td.querySelector('div');
            if (!div || div.classList.contains(flagCollapsed)) return;
            this.handleClickTableCellDdlPreview(event, td, optionList, cellSelector, (event, element) => { ddlHookup(event, element); });
        });
    }
    hookupProductPermutationVariationFields() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagProductVariations, (event, element) => this.handleClickProductPermutationVariationsPreview(event, element));
    }
    handleClickProductPermutationVariationsPreview(event, element) {
        console.log("click product permutation variations preview");
        this.toggleColumnCollapsed(flagProductVariations, false);
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
    toggleColumnCollapsed(flagColumn, isCollapsed) {
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
        let table = this.getTableMain();
        let columnTh = table.querySelector('th.' + columnFlag);
        let columnThHasFlag = columnTh.classList.contains(classnameFlag);
        if (isRequiredFlag == columnThHasFlag) return;
        let columnTds = table.querySelectorAll('td.' + columnFlag);
        DOM.toggleElementHasClassnameFlag(columnTh, isRequiredFlag, classnameFlag);
        columnTds.forEach((columnTd) => {
            DOM.toggleElementHasClassnameFlag(columnTd, isRequiredFlag, classnameFlag);
        });
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
    initialiseRowNew(row) {}
    hookupTableMain() {}
    isDirtyRow(row) {}
    leave() {}
}
*/