
import API from "../../api.js";
import BusinessObjects from "../../lib/business_objects/business_objects.js";
import DOM from "../../dom.js";
import Events from "../../lib/events.js";
import TableBasePage from "../base_table.js";
import Utils from "../../lib/utils.js";
import Validation from "../../lib/validation.js";
import StoreTableMixinPage from "./mixin_table.js";

export default class PageStoreProductVariations extends TableBasePage {
    static hash = hashPageStoreProductVariations;
    static attrIdRowObject = attrIdProductVariationType;
    callFilterTableContent = API.getProductVariationsByFilters;
    callSaveTableContent = API.saveProductVariations;

    constructor(router) {
        super(router);
        this.storeMixin = new StoreTableMixinPage(this);
    }

    initialize() {
        this.sharedInitialize();
    }

    hookupFilters() {
        this.sharedHookupFilters();
        this.hookupFilterActive();
        this.hookupFilterIsNotEmpty();
    }

    loadRowTable(rowJson) {
    }
    getJsonRow(row) {
        if (row == null) return;
        let inputDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' input');
        let textareaCode = row.querySelector('td.' + flagCode + ' textarea');
        let textareaName = row.querySelector('td.' + flagName + ' textarea');
        let textareaNamePlural = row.querySelector('td.' + flagNamePlural + ' textarea');
        let tdProductVariations = row.querySelector('td.' + flagProductVariations);
        let buttonActive = row.querySelector('td.' + flagActive + ' button');

        let jsonRow = {};
        jsonRow[attrIdProductVariationType] = row.getAttribute(attrIdProductVariationType);
        if (Validation.isEmpty(jsonRow[attrIdProductVariationType])) jsonRow[attrIdProductVariationType] = -1;
        jsonRow[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(inputDisplayOrder);
        jsonRow[flagCode] = DOM.getElementAttributeValueCurrent(textareaCode);
        jsonRow[flagName] = DOM.getElementAttributeValueCurrent(textareaName);
        jsonRow[flagNamePlural] = DOM.getElementAttributeValueCurrent(textareaNamePlural);
        
        let variations = [];
        if (tdProductVariations.classList.contains(flagDirty)) {
            let trsProductVariation = tdProductVariations.querySelectorAll('tr.' + flagProductVariation + '.' + flagDirty);
            if (trsProductVariation != null) {
                trsProductVariation.forEach((tr, indexRow) => {
                    variations.push(this.getJsonRowProductVariation(tr, indexRow));
                });
            }
        }
        else {
            // variations = BusinessObjects.getListObjectsFromIdDictAndCsv(productVariationTypes, DOM.getElementAttributeValueCurrent(tdProductVariations));
        }
        jsonRow[flagProductVariations] = variations;
        jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
        return jsonRow;
    }
    getJsonRowProductVariation(tr, indexRow) {
        let inputDisplayOrder = tr.querySelector('td.' + flagDisplayOrder + ' input');
        let textareaCode = tr.querySelector('td.' + flagCode + ' textarea');
        let textareaName = tr.querySelector('td.' + flagName + ' textarea');
        // let checkboxActive = tr.querySelector('td.' + flagActive + ' input');
        let buttonActive = tr.querySelector('td.' + flagActive + ' button');

        let jsonRow = {};
        jsonRow[attrIdProductVariation] = tr.getAttribute(attrIdProductVariation);
        if (Validation.isEmpty(jsonRow[attrIdProductVariation])) jsonRow[attrIdProductVariation] = -1 - indexRow;
        jsonRow[attrIdProductVariationType] = tr.getAttribute(attrIdProductVariationType);
        jsonRow[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(inputDisplayOrder);
        jsonRow[flagCode] = DOM.getElementAttributeValueCurrent(textareaCode);
        jsonRow[flagName] = DOM.getElementAttributeValueCurrent(textareaName);
        jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);

        return jsonRow;
    }
    initialiseRowNew(tbody, row) {
        super.initialiseRowNew(tbody, row);
        this.initialiseSliderDisplayOrderRowNew(tbody, row);
    }

    hookupTableMain() {
        super.hookupTableMain();
        this.hookupSlidersDisplayOrderTable();
        this.hookupTextareasCodeTable();
        this.hookupTextareasNameTable();
        this.hookupTextareasNamePluralTable();
        this.hookupFieldsProductVariation();
        this.hookupFieldsActive();
    }
    hookupTextareasNamePluralTable() {
        this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagNamePlural + ' textarea');
    }
    hookupFieldsProductVariation() {
        this.hookupProductVariationsPreviews();
        this.hookupFieldsProductVariationDisplayOrder();
        this.hookupFieldsProductVariationCode();
        this.hookupFieldsProductVariationName();
        this.hookupFieldsProductVariationActive();
    }
    hookupProductVariationsPreviews() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagProductVariations + ' div', (event, element) => {
            let td = DOM.getCellFromElement(element);
            if (!td.classList.contains(flagCollapsed)) return;
            this.handleClickProductVariationsPreview(event, element);
        });
    }
    handleClickProductVariationsPreview(event, element) {
        if (_verbose) { console.log("click order items preview"); }
        let row = DOM.getRowFromElement(element);
        let idProductVariationType = row.getAttribute(attrIdProductVariationType);
        let productVariationType = productVariationTypes[idProductVariationType];
        if (productVariationType == null) productVariationType = {
            [flagProductVariations]: [],
        };
        let tblProductVariations = document.createElement("table");
        tblProductVariations.classList.add(flagProductVariations);
        let thead = document.createElement("thead");
        let tr = document.createElement("tr");
        
        let thDisplayOrder = document.createElement("th");
        thDisplayOrder.classList.add(flagDisplayOrder);
        thDisplayOrder.textContent = 'Display Order';
        let thCode = document.createElement("th");
        thCode.classList.add(flagCode);
        thCode.textContent = 'Code';
        let thName = document.createElement("th");
        thName.classList.add(flagName);
        thName.textContent = 'Name';
        let thActive = document.createElement("th");
        thActive.classList.add(flagActive);
        // thActive.textContent = 'Active';
        let buttonAdd = document.createElement("button");
        buttonAdd.classList.add(flagActive);
        buttonAdd.classList.add(flagAdd);
        buttonAdd.textContent = '+';
        thActive.appendChild(buttonAdd);

        tr.appendChild(thDisplayOrder);
        tr.appendChild(thCode);
        tr.appendChild(thName);
        tr.appendChild(thActive);
        thead.appendChild(tr);
        tblProductVariations.appendChild(thead);

        let tbody = document.createElement("tbody");
        productVariationType[flagProductVariations].forEach((productVariation, index) => {
            this.addRowProductVariation(tbody, productVariation);
        });
        tblProductVariations.appendChild(tbody);
        
        let cell = DOM.getCellFromElement(element);
        let cellNew = cell.cloneNode(false);
        cellNew.appendChild(tblProductVariations);
        cellNew.classList.remove(flagCollapsed);
        row.replaceChild(cellNew, cell);
        if (_verbose) { console.log("tblProductVariations: ", tblProductVariations); }
        this.toggleColumnHeaderCollapsed(flagProductVariations, false);
        this.hookupFieldsProductVariation();
    }
    addRowProductVariation(tbody, productVariation) {
        if (_verbose) { console.log("addRowProductVariation: ", productVariation); }

        let tdDisplayOrder = document.createElement("td");
        tdDisplayOrder.classList.add(flagDisplayOrder);
        let inputDisplayOrder = document.createElement("input");
        inputDisplayOrder.classList.add(flagDisplayOrder);
        inputDisplayOrder.type = 'number';
        inputDisplayOrder.step = 1;
        DOM.setElementValuesCurrentAndPrevious(inputDisplayOrder, productVariation[flagDisplayOrder]);
        tdDisplayOrder.appendChild(inputDisplayOrder);
        
        let tdCode = document.createElement("td");
        tdCode.classList.add(flagCode);
        let textareaCode = document.createElement("textarea");
        textareaCode.classList.add(flagCode);
        DOM.setElementValuesCurrentAndPrevious(textareaCode, productVariation[flagCode]);
        tdCode.appendChild(textareaCode);

        let tdName = document.createElement("td");
        tdName.classList.add(flagName);
        let textareaName = document.createElement("textarea");
        textareaName.classList.add(flagName);
        DOM.setElementValuesCurrentAndPrevious(textareaName, productVariation[flagName]);
        tdName.appendChild(textareaName);

        let tdActive = document.createElement("td");
        tdActive.classList.add(flagActive);
        let buttonActive = document.createElement("button");
        buttonActive.classList.add(flagActive);
        buttonActive.classList.add(productVariation[flagActive] ? flagDelete : flagAdd);
        buttonActive.textContent = productVariation[flagActive] ? 'x' : '+';
        DOM.setElementAttributesValuesCurrentAndPrevious(buttonActive, productVariation[flagActive]);
        tdActive.appendChild(buttonActive);
        
        let tr = document.createElement("tr");
        tr.classList.add(flagProductVariation);
        tr.setAttribute(attrIdProductVariationType, productVariation[attrIdProductVariationType]);
        tr.setAttribute(attrIdProductVariation, productVariation[attrIdProductVariation]);
        tr.appendChild(tdDisplayOrder);
        tr.appendChild(tdCode);
        tr.appendChild(tdName);
        tr.appendChild(tdActive);
        tbody.appendChild(tr);
    }
    hookupFieldsProductVariationDisplayOrder() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagProductVariations + ' td.' + flagDisplayOrder + ' input');
    }
    hookupFieldsProductVariationCode() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagProductVariations + ' textarea.' + flagCode);
    }
    hookupFieldsProductVariationName() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagProductVariations + ' textarea.' + flagName);
    }
    hookupFieldsProductVariationActive() {
        this.hookupFieldsActive(flagProductVariations, (event, element) => { this.hookupButtonsProductVariationAdd(event, element); });
    }
    hookupButtonsProductVariationAdd(event, element) {
        let row = element.closest(idTableMain + ' > tbody > tr');
        let idProductVariationType = row.getAttribute(attrIdProductVariationType);
        let idProductVariation = row.getAttribute(attrIdProductVariation);
        let countProductVariations = row.querySelectorAll('td.' + flagProductVariations + ' tr').length;
        let productVariation = {
            [attrIdProductVariationType]: idProductVariationType,
            [attrIdProductVariation]: idProductVariation,
            [flagCode]: '',
            [flagName]: '',
            [flagDisplayOrder]: countProductVariations,
            [flagActive]: true,
        };
        let tbody = row.querySelector('td.' + flagProductVariations + ' table tbody');
        this.addRowProductVariation(tbody, productVariation);
        this.hookupFieldsProductVariation();
    }
    
    leave() {
        super.leave();
    }
}

