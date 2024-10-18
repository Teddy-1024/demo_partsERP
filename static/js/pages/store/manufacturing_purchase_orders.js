
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
        let tdCurrency = row.querySelector('td.' + flagCurrency);
        let inputCostTotalLocalVatExcl = row.querySelector('td.' + flagCostTotalLocalVatExcl + ' input');
        let inputCostTotalLocalVatIncl = row.querySelector('td.' + flagCostTotalLocalVatIncl + ' input');
        let inputPriceTotalLocalVatExcl = row.querySelector('td.' + flagPriceTotalLocalVatExcl + ' input');
        let inputPriceTotalLocalVatIncl = row.querySelector('td.' + flagPriceTotalLocalVatIncl + ' input');
        let tdItems = row.querySelector('td.' + flagItems);
        let checkboxActive = row.querySelector('td.' + flagActive + ' textarea');

        let jsonRow = {};
        jsonRow[attrIdSupplierPurchaseOrder] = row.getAttribute(attrIdSupplierPurchaseOrder);
        jsonRow[attrIdCurrency] = DOM.getElementAttributeValueCurrent(tdCurrency);
        jsonRow[flagCostTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatExcl);
        jsonRow[flagCostTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatIncl);
        jsonRow[flagPriceTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputPriceTotalLocalVatExcl);
        jsonRow[flagPriceTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputPriceTotalLocalVatIncl);
        jsonRow[flagItems] = DOM.getElementAttributeValueCurrent(tdItems);
        jsonRow[flagActive] = DOM.getElementAttributeValueCurrent(checkboxActive);
        return jsonRow;
    }
    initialiseRowNew(row) {
        super.initialiseRowNew(row);
    }

    hookupTableMain() {
        super.hookupTableMain();
        this.hookupCurrencyFields();
        this.hookupCostInputs();
        this.hookupOrderItemsFields();
        this.hookupActiveCheckboxes();
    }
    hookupCostInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatExcl + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatIncl + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagPriceTotalLocalVatExcl + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagPriceTotalLocalVatIncl + ' input');
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

