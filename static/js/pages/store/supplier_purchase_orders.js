
import API from "../../api.js";
import BusinessObjects from "../../lib/business_objects.js";
import DOM from "../../dom.js";
import Events from "../../lib/events.js";
import TableBasePage from "../base_table.js";
import Utils from "../../lib/utils.js";
import Validation from "../../lib/validation.js";
import StoreTableMixinPage from "./mixin_table.js";

export default class PageStoreSupplierPurchaseOrders extends TableBasePage {
    static hash = hashPageStoreSupplierPurchaseOrders;
    static attrIdRowObject = attrIdSupplierPurchaseOrder;
    callFilterTableContent = API.getSupplierPurchaseOrdersByFilters;
    callSaveTableContent = API.saveSupplierPurchaseOrders;

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
    }

    loadRowTable(rowJson) {
    }
    getJsonRow(row) {
        if (row == null) return;
        let tdSupplier = row.querySelector('td.' + flagSupplier);
        let tdCurrency = row.querySelector('td.' + flagCurrency);
        let inputCostTotalLocalVatExcl = row.querySelector('td.' + flagCostTotalLocalVatExcl + ' input');
        let inputCostTotalLocalVatIncl = row.querySelector('td.' + flagCostTotalLocalVatIncl + ' input');
        let tdItems = row.querySelector('td.' + flagItems);
        let checkboxActive = row.querySelector('td.' + flagActive + ' textarea');

        let jsonRow = {};
        jsonRow[attrIdSupplierPurchaseOrder] = row.getAttribute(attrIdSupplierPurchaseOrder);
        jsonRow[attrIdSupplier] = DOM.getElementAttributeValueCurrent(tdSupplier);
        jsonRow[attrIdCurrency] = DOM.getElementAttributeValueCurrent(tdCurrency);
        jsonRow[flagCostTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatExcl);
        jsonRow[flagCostTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatIncl);
        jsonRow[flagItems] = DOM.getElementAttributeValueCurrent(tdItems);
        jsonRow[flagActive] = DOM.getElementAttributeValueCurrent(checkboxActive);
        return jsonRow;
    }
    initialiseRowNew(row) {
        super.initialiseRowNew(row);
    }

    hookupTableMain() {
        super.hookupTableMain();
        this.hookupSupplierFields();
        this.hookupCurrencyFields();
        this.hookupCostInputs();
        this.hookupOrderItemsFields();
        this.hookupActiveCheckboxes();
    }
    hookupSupplierFields() {
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagSupplier, Utils.getListFromDict(suppliers));
    }
    hookupCostInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatExcl + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatIncl + ' input');
    }
    hookupOrderItemsFields() {
        
    }
    hookupActiveCheckboxes(){
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagActive + ' input');
    }

    leave() {
        super.leave();
    }
}

