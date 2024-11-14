
import API from "../../api.js";
import BusinessObjects from "../../lib/business_objects/business_objects.js";
import DOM from "../../dom.js";
import Events from "../../lib/events.js";
import ProductPermutation from "../../lib/business_objects/store/product_permutation.js";
import TableBasePage from "../base_table.js";
import Utils from "../../lib/utils.js";
import Validation from "../../lib/validation.js";
import StoreTableMixinPage from "./mixin_table.js";

export default class PageStoreManufacturingPurchaseOrders extends TableBasePage {
    static hash = hashPageStoreManufacturingPurchaseOrders;
    static attrIdRowObject = attrIdManufacturingPurchaseOrder;
    callFilterTableContent = API.getManufacturingPurchaseOrdersByFilters;
    callSaveTableContent = API.saveManufacturingPurchaseOrders;

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
        let trsPurchaseOrderItem = row.querySelectorAll('tr.' + flagOrderItems);
        let buttonActive = row.querySelector(':scope > td.' + flagActive + ' button');

        let jsonRow = {};
        jsonRow[attrIdManufacturingPurchaseOrder] = row.getAttribute(attrIdManufacturingPurchaseOrder);
        jsonRow[attrIdCurrency] = DOM.getElementAttributeValueCurrent(tdCurrency);
        jsonRow[flagCostTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatExcl);
        jsonRow[flagCostTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatIncl);
        jsonRow[flagPriceTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputPriceTotalLocalVatExcl);
        jsonRow[flagPriceTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputPriceTotalLocalVatIncl);
        let orderItems = [];
        if (trsPurchaseOrderItem != null) {
            trsPurchaseOrderItem.forEach((tr) => {
                orderItems.push(this.getJsonRowOrderItem(tr));
            });
        }
        jsonRow[flagOrderItems] = orderItems;
        jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
        return jsonRow;
    }
    getJsonRowOrderItem(tr) {
        let inputDisplayOrder = tr.querySelector('td.' + flagDisplayOrder + ' input');
        let tdCategory = tr.querySelector('td.' + flagProductCategory);
        let tdProduct = tr.querySelector('td.' + flagProduct);
        let tdVariations = tr.querySelector('td.' + flagProductVariations);
        let tdUnitQuantity = tr.querySelector('td.' + flagUnitMeasurementQuantity);
        let inputQuantityUsed = tr.querySelector('td.' + flagQuantityUsed + ' input');
        let inputQuantityProduced = tr.querySelector('td.' + flagQuantityProduced + ' input');
        let tdUnitMeasurementLatencyManufacture = tr.querySelector('td.' + flagUnitMeasurementLatencyManufacture);
        let inputLatencyManufacture = tr.querySelector('td.' + flagLatencyManufacture + ' input');
        let buttonActive = tr.querySelector(':scope > td.' + flagActive + ' button');

        let jsonRow = {};
        jsonRow[attrIdManufacturingPurchaseOrder] = tr.getAttribute(attrIdManufacturingPurchaseOrder);
        jsonRow[attrIdManufacturingPurchaseOrderProductLink] = tr.getAttribute(attrIdManufacturingPurchaseOrderProductLink);
        jsonRow[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(inputDisplayOrder);
        jsonRow[attrIdProductCategory] = DOM.getElementAttributeValueCurrent(tdCategory);
        jsonRow[attrIdProduct] = DOM.getElementAttributeValueCurrent(tdProduct);
        jsonRow[flagProductVariations] = DOM.getElementAttributeValueCurrent(tdVariations);
        jsonRow[attrIdUnitMeasurementQuantity] = DOM.getElementAttributeValueCurrent(tdUnitQuantity);
        jsonRow[flagQuantityUsed] = DOM.getElementAttributeValueCurrent(inputQuantityUsed);
        jsonRow[flagQuantityProduced] = DOM.getElementAttributeValueCurrent(inputQuantityProduced);
        jsonRow[attrIdUnitMeasurementLatencyManufacture] = DOM.getElementAttributeValueCurrent(tdUnitMeasurementLatencyManufacture);
        jsonRow[flagLatencyManufacture] = DOM.getElementAttributeValueCurrent(inputLatencyManufacture);
        jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);

        return jsonRow;
    }
    initialiseRowNew(tbody, row) {
        super.initialiseRowNew(tbody, row);
    }

    hookupTableMain() {
        super.hookupTableMain();
        this.hookupCurrencyFields();
        this.hookupCostAndPriceInputs();
        this.hookupOrderItemsFields();
        this.hookupFieldsActive();
    }
    hookupCostAndPriceInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatExcl + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatIncl + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagPriceTotalLocalVatExcl + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagPriceTotalLocalVatIncl + ' input');
    }
    hookupOrderItemsFields() {
        this.hookupOrderItemsPreviews();
        this.hookupFieldsOrderItemDisplayOrder();
        this.hookupFieldsOrderItemProductCategory();
        this.hookupFieldsOrderItemProduct();
        this.hookupFieldsOrderItemProductVariations();
        this.hookupFieldsOrderItemUnitQuantity();
        this.hookupFieldsOrderItemQuantityUsed();
        this.hookupFieldsOrderItemQuantityProduced();
        this.hookupFieldsOrderItemUnitMeasurementLatencyManufacture();
        this.hookupFieldsOrderItemLatencyManufacture();
        this.hookupFieldsOrderItemActive();
        this.hookupFieldsOrderItemAddDelete();
        this.hookupButtonsOrderItemAdd();
    }
    hookupOrderItemsPreviews() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagOrderItems, (event, td) => {
            if (!td.classList.contains(flagCollapsed)) return;
            this.handleClickOrderItemsPreview(event, td);
        });
    }
    handleClickOrderItemsPreview(event, element) {
        if (_verbose) { console.log("click order items preview"); }
        this.toggleColumnHeaderCollapsed(flagOrderItems, false);
        element.classList.remove(flagCollapsed);
        let row = DOM.getRowFromElement(element);
        let idManufacturingPurchaseOrder = row.getAttribute(attrIdManufacturingPurchaseOrder);
        let manufacturingPurchaseOrder = idManufacturingPurchaseOrder > 0 ? manufacturingPurchaseOrders[idManufacturingPurchaseOrder] : {
            [flagOrderItems]: [],
        };
        let tblOrderItems = document.createElement("table");
        tblOrderItems.classList.add(flagOrderItems);
        let thead = document.createElement("thead");
        let tr = document.createElement("tr");
        
        let thDisplayOrder = document.createElement("th");
        thDisplayOrder.classList.add(flagDisplayOrder);
        thDisplayOrder.textContent = 'Display Order';
        let thCategory = document.createElement("th");
        thCategory.classList.add(flagProductCategory);
        thCategory.textContent = 'Category';
        let thProduct = document.createElement("th");
        thProduct.classList.add(flagProduct);
        thProduct.textContent = 'Product';
        let thVariations = document.createElement("th");
        thVariations.classList.add(flagProductVariations);
        thVariations.classList.add(flagCollapsed);
        thVariations.textContent = 'Variations';
        let thUnitQuantity = document.createElement("th");
        thUnitQuantity.classList.add(flagUnitMeasurementQuantity);
        thUnitQuantity.textContent = 'Unit Quantity';
        let thQuantityUsed = document.createElement("th");
        thQuantityUsed.classList.add(flagQuantityUsed);
        thQuantityUsed.textContent = 'Quantity Used';
        let thQuantityProduced = document.createElement("th");
        thQuantityProduced.classList.add(flagQuantityProduced);
        thQuantityProduced.textContent = 'Quantity Produced';
        /*
        let thCostTotalLocalVatExcl = document.createElement("th");
        thCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
        thCostTotalLocalVatExcl.textContent = 'Cost Total Local VAT Excl';
        let thCostTotalLocalVatIncl = document.createElement("th");
        thCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
        thCostTotalLocalVatIncl.textContent = 'Cost Total Local VAT Incl';
        let thCostUnitLocalVatExcl = document.createElement("th");
        thCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
        thCostUnitLocalVatExcl.textContent = 'Cost Unit Local VAT Excl';
        let thCostUnitLocalVatIncl = document.createElement("th");
        thCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
        thCostUnitLocalVatIncl.textContent = 'Cost Unit Local VAT Incl';
        */
        let thUnitMeasurementLatencyManufacture = document.createElement("th");
        thUnitMeasurementLatencyManufacture.classList.add(flagUnitMeasurementLatencyManufacture);
        thUnitMeasurementLatencyManufacture.textContent = 'Unit Measurement Latency Manufacture';
        let thLatencyManufacture = document.createElement("th");
        thLatencyManufacture.classList.add(flagLatencyManufacture);
        thLatencyManufacture.textContent = 'Latency Manufacture';
        let thActive = document.createElement("th");
        thActive.classList.add(flagActive);
        thActive.textContent = 'Active';
        let thAddDelete = document.createElement("th");
        thAddDelete.classList.add(flagAdd);
        let buttonAdd = document.createElement("button");
        buttonAdd.classList.add(flagAdd);
        buttonAdd.textContent = '+';
        thAddDelete.appendChild(buttonAdd);

        tr.appendChild(thDisplayOrder);
        tr.appendChild(thCategory);
        tr.appendChild(thProduct);
        tr.appendChild(thVariations);
        tr.appendChild(thUnitQuantity);
        tr.appendChild(thQuantityUsed);
        tr.appendChild(thQuantityProduced);
        /*
        tr.appendChild(thCostTotalLocalVatExcl);
        tr.appendChild(thCostTotalLocalVatIncl);
        tr.appendChild(thCostUnitLocalVatExcl);
        tr.appendChild(thCostUnitLocalVatIncl);
        */
        tr.appendChild(thUnitMeasurementLatencyManufacture);
        tr.appendChild(thLatencyManufacture);
        tr.appendChild(thActive);
        tr.appendChild(thAddDelete);
        thead.appendChild(tr);
        tblOrderItems.appendChild(thead);

        let tbody = document.createElement("tbody");
        manufacturingPurchaseOrder[flagOrderItems].forEach((orderItem, index) => {
            this.addRowManufacturingPurchaseOrderItem(tbody, orderItem);
        });
        tblOrderItems.appendChild(tbody);
        
        let cell = DOM.getCellFromElement(element);
        let cellNew = cell.cloneNode(false);
        cellNew.appendChild(tblOrderItems);
        row.replaceChild(cellNew, cell);
        if (_verbose) { console.log("tblOrderItems: ", tblOrderItems); }
        this.hookupOrderItemsFields();
    }
    addRowManufacturingPurchaseOrderItem(tbody, orderItem) { //  productVariationTypeOptions, productVariationOptions, productCategoryOptions, productOptions, unitMeasurementOptions, 
        if (_verbose) { console.log("addRowManufacturingPurchaseOrderItem: ", orderItem); }
        let tdDisplayOrder = document.createElement("td");
        tdDisplayOrder.classList.add(flagDisplayOrder);
        let inputDisplayOrder = document.createElement("input");
        inputDisplayOrder.classList.add(flagDisplayOrder);
        inputDisplayOrder.type = 'number';
        inputDisplayOrder.step = 1;
        DOM.setElementValuesCurrentAndPrevious(inputDisplayOrder, orderItem[flagDisplayOrder]);
        tdDisplayOrder.appendChild(inputDisplayOrder);

        let tdCategory = document.createElement("td");
        tdCategory.classList.add(flagProductCategory);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdCategory, orderItem[attrIdProductCategory]);
        let divCategory = document.createElement("div");
        divCategory.classList.add(flagProductCategory);
        // DOM.setElementAttributesValuesCurrentAndPrevious(divCategory, orderItem[attrIdProductCategory]);
        let productCategory = productCategories[orderItem[attrIdProductCategory]];
        divCategory.textContent = BusinessObjects.getObjectText(productCategory);
        tdCategory.appendChild(divCategory);

        let tdProduct = document.createElement("td");
        tdProduct.classList.add(flagProduct);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdProduct, orderItem[attrIdProductCategory]);
        let divProduct = document.createElement("div");
        divProduct.classList.add(flagProduct);
        // DOM.setElementAttributesValuesCurrentAndPrevious(divProduct, orderItem[attrIdProduct]);
        let product = products[orderItem[attrIdProduct]];
        divProduct.textContent = BusinessObjects.getObjectText(product);
        tdProduct.appendChild(divProduct);

        let tdVariations = document.createElement("td");
        tdVariations.classList.add(flagProductVariations);
        tdVariations.classList.add(flagCollapsed);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdVariations, orderItem[attrIdProductCategory]);
        let divVariations = document.createElement("div");
        divVariations.classList.add(flagProductVariations);
        // DOM.setElementAttributesValuesCurrentAndPrevious(divVariations, orderItem[attrIdProductVariation]);
        let variationsText = ProductPermutation.getProductVariationsPreviewFromIdCsv(orderItem[flagProductVariations]);
        divVariations.textContent = variationsText;
        tdVariations.appendChild(divVariations);

        let tdUnitQuantity = document.createElement("td");
        tdUnitQuantity.classList.add(flagUnitMeasurementQuantity);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdUnitQuantity, orderItem[attrIdProductCategory]);
        let divUnitQuantity = document.createElement("div");
        divUnitQuantity.classList.add(flagUnitMeasurementQuantity);
        // DOM.setElementValuesCurrentAndPrevious(divUnitQuantity, orderItem[flagUnitMeasurementQuantity]);
        let unitQuantity = unitMeasurements[orderItem[attrIdUnitMeasurementQuantity]];
        divUnitQuantity.textContent = BusinessObjects.getObjectText(unitQuantity);
        tdUnitQuantity.appendChild(divUnitQuantity);

        let tdQuantityUsed = document.createElement("td");
        tdQuantityUsed.classList.add(flagQuantityUsed);
        let inputQuantityUsed = document.createElement("input");
        inputQuantityUsed.classList.add(flagQuantityUsed);
        inputQuantityUsed.type = 'number';
        DOM.setElementValuesCurrentAndPrevious(inputQuantityUsed, orderItem[flagQuantityUsed]);
        tdQuantityUsed.appendChild(inputQuantityUsed);

        let tdQuantityProduced = document.createElement("td");
        tdQuantityProduced.classList.add(flagQuantityProduced);
        let inputQuantityProduced = document.createElement("input");
        inputQuantityProduced.classList.add(flagQuantityProduced);
        inputQuantityProduced.type = 'number';
        DOM.setElementValuesCurrentAndPrevious(inputQuantityProduced, orderItem[flagQuantityProduced]);
        tdQuantityProduced.appendChild(inputQuantityProduced);

        /*
        let tdCostTotalLocalVatExcl = document.createElement("td");
        tdCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
        let inputCostTotalLocalVatExcl = document.createElement("input");
        inputCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
        inputCostTotalLocalVatExcl.type = 'number';
        inputCostTotalLocalVatExcl.step = 0.01;
        DOM.setElementAttributesValuesCurrentAndPrevious(inputCostTotalLocalVatExcl, orderItem[flagCostTotalLocalVatExcl]);
        tdCostTotalLocalVatExcl.appendChild(inputCostTotalLocalVatExcl);

        let tdCostTotalLocalVatIncl = document.createElement("td");
        tdCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
        let inputCostTotalLocalVatIncl = document.createElement("input");
        inputCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
        inputCostTotalLocalVatIncl.type = 'number';
        inputCostTotalLocalVatIncl.step = 0.01;
        DOM.setElementAttributesValuesCurrentAndPrevious(inputCostTotalLocalVatIncl, orderItem[flagCostTotalLocalVatIncl]);
        tdCostTotalLocalVatIncl.appendChild(inputCostTotalLocalVatIncl);

        let tdCostUnitLocalVatExcl = document.createElement("td");
        tdCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
        let divCostUnitLocalVatExcl = document.createElement("div");
        divCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
        DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatExcl, orderItem[flagCostUnitLocalVatExcl]);
        tdCostUnitLocalVatExcl.appendChild(divCostUnitLocalVatExcl);

        let tdCostUnitLocalVatIncl = document.createElement("td");
        tdCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
        let divCostUnitLocalVatIncl = document.createElement("div");
        divCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
        DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatIncl, orderItem[flagCostUnitLocalVatIncl]);
        tdCostUnitLocalVatIncl.appendChild(divCostUnitLocalVatIncl);
        */

        let tdUnitMeasurementLatencyManufacture = document.createElement("td");
        tdUnitMeasurementLatencyManufacture.classList.add(flagUnitMeasurementLatencyManufacture);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdUnitMeasurementLatencyManufacture, orderItem[attrIdUnitMeasurementLatencyManufacture]);
        let divUnitMeasurementLatencyManufacture = document.createElement("div");
        divUnitMeasurementLatencyManufacture.classList.add(flagUnitMeasurementLatencyManufacture);
        // DOM.setElementValuesCurrentAndPrevious(divUnitMeasurementLatencyManufacture, orderItem[flagUnitMeasurementLatencyManufacture]);
        let unitMeasurementLatencyManufacture = unitMeasurementsTime[orderItem[attrIdUnitMeasurementLatencyManufacture]];
        divUnitMeasurementLatencyManufacture.textContent = BusinessObjects.getObjectText(unitMeasurementLatencyManufacture);
        tdUnitMeasurementLatencyManufacture.appendChild(divUnitMeasurementLatencyManufacture);
        
        let tdLatencyManufacture = document.createElement("td");
        tdLatencyManufacture.classList.add(flagLatencyManufacture);
        let inputLatencyManufacture = document.createElement("input");
        inputLatencyManufacture.classList.add(flagLatencyManufacture);
        inputLatencyManufacture.type = 'number';
        inputLatencyManufacture.step = 1;
        DOM.setElementValuesCurrentAndPrevious(inputLatencyManufacture, orderItem[flagLatencyManufacture]);
        tdLatencyManufacture.appendChild(inputLatencyManufacture);

        let tdActive = this.createTdActive(orderItem[flagActive]);

        let tr = document.createElement("tr");
        tr.classList.add(flagOrderItems);
        tr.setAttribute(attrIdManufacturingPurchaseOrder, orderItem[attrIdManufacturingPurchaseOrder]);
        tr.setAttribute(attrIdManufacturingPurchaseOrderProductLink, orderItem[attrIdManufacturingPurchaseOrderProductLink]);
        tr.appendChild(tdDisplayOrder);
        tr.appendChild(tdCategory);
        tr.appendChild(tdProduct);
        tr.appendChild(tdVariations);
        tr.appendChild(tdUnitQuantity);
        tr.appendChild(tdQuantityUsed);
        tr.appendChild(tdQuantityProduced);
        /*
        tr.appendChild(tdCostTotalLocalVatExcl);
        tr.appendChild(tdCostTotalLocalVatIncl);
        tr.appendChild(tdCostUnitLocalVatExcl);
        tr.appendChild(tdCostUnitLocalVatIncl);
        */
        tr.appendChild(tdUnitMeasurementLatencyManufacture);
        tr.appendChild(tdLatencyManufacture);
        tr.appendChild(tdActive);
        tbody.appendChild(tr);
    }
    hookupFieldsOrderItemDisplayOrder() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagDisplayOrder + ' input');
    }
    hookupFieldsOrderItemProductCategory() {
        this.hookupTableCellDdlPreviews(
            idTableMain + ' td.' + flagOrderItems + ' td.' + flagProductCategory
            , Utils.getListFromDict(productCategories)
            , (cellSelector) => { this.hookupProductCategoryDdls(cellSelector); }
        );
    }
    hookupFieldsOrderItemProduct() {
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagOrderItems + ' td.' + flagProduct, Utils.getListFromDict(products));
    }
    hookupFieldsOrderItemProductVariations() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagOrderItems + ' td.' + flagProductVariations, (event, element) => this.handleClickProductPermutationVariationsPreview(event, element));
    }
    hookupFieldsOrderItemUnitQuantity() {
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagOrderItems + ' td.' + flagUnitMeasurementQuantity, Utils.getListFromDict(unitMeasurements));
    }
    hookupFieldsOrderItemQuantityUsed() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagQuantityUsed + ' input');
    }
    hookupFieldsOrderItemQuantityProduced() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagQuantityProduced + ' input');
    }
    /*
    hookupFieldsOrderItemPriceTotalLocalVatExcl() {
        this.hookupChangeHandlerTableCells(
            idTableMain + ' td.' + flagOrderItems + ' td.' + flagPriceTotalLocalVatExcl + ' input'
            , (event, element) => { 
                this.handleChangeNestedElementCellTable(event, element);
                this.updateFieldsPriceUnitLocalVatExcl(element);
            }
        );
    }
    hookupFieldsOrderItemPriceTotalLocalVatIncl() {
        this.hookupChangeHandlerTableCells(
            idTableMain + ' td.' + flagOrderItems + ' td.' + flagPriceTotalLocalVatIncl + ' input' 
            , (event, element) => { 
                this.handleChangeNestedElementCellTable(event, element);
                this.updateFieldsPriceUnitLocalVatIncl(element);
            }
        );
    }
    updateFieldsPriceUnitLocalVatExcl(elementChanged) {
        let row = elementChanged.closest('tr.' + flagOrderItems);
        let inputPriceTotalLocalVatExcl = row.querySelector('td.' + flagPriceTotalLocalVatExcl + ' input');
        let priceTotalLocalVatExcl = DOM.getElementValueCurrent(inputPriceTotalLocalVatExcl);
        let inputQuantityUsed = row.querySelector('td.' + flagQuantityUsed + ' input');
        let quantityUsed = DOM.getElementValueCurrent(inputQuantityUsed);

        let divPriceUnitLocalVatExcl = row.querySelector('td.' + flagPriceUnitLocalVatExcl + ' div');
        let priceUnitLocalVatExcl = quantityUsed == 0 ? 0 : priceTotalLocalVatExcl / quantityUsed;
        DOM.setElementValuesCurrentAndPrevious(divPriceUnitLocalVatExcl, priceUnitLocalVatExcl);

        let rowManufacturingPurchaseOrder = row.closest(idTableMain + ' > tbody > tr');
        let divPriceGrandTotalLocalVatExcl = rowManufacturingPurchaseOrder.querySelector('td.' + flagPriceTotalLocalVatExcl + ' div');
        let inputsPriceTotalLocalVatExcl = rowManufacturingPurchaseOrder.querySelectorAll('td.' + flagOrderItems + ' td.' + flagPriceTotalLocalVatExcl + ' input');
        let priceGrandTotalLocalVatExcl = Array.from(inputsPriceTotalLocalVatExcl).reduce((acc, input) => acc + Number(DOM.getElementValueCurrent(input)), 0);
        DOM.setElementValueCurrent(divPriceGrandTotalLocalVatExcl, priceGrandTotalLocalVatExcl);
    }
    updateFieldsPriceUnitLocalVatIncl(elementChanged) {
        let row = elementChanged.closest('tr.' + flagOrderItems);
        let inputPriceTotalLocalVatIncl = row.querySelector('td.' + flagPriceTotalLocalVatIncl + ' input');
        let priceTotalLocalVatIncl = DOM.getElementValueCurrent(inputPriceTotalLocalVatIncl);
        let inputQuantityUsed = row.querySelector('td.' + flagQuantityUsed + ' input');
        let quantityUsed = DOM.getElementValueCurrent(inputQuantityUsed);

        let divPriceUnitLocalVatIncl = row.querySelector('td.' + flagPriceUnitLocalVatIncl + ' div');
        let priceUnitLocalVatIncl = quantityUsed == 0 ? 0 : priceTotalLocalVatIncl / quantityUsed;
        DOM.setElementValuesCurrentAndPrevious(divPriceUnitLocalVatIncl, priceUnitLocalVatIncl);

        let rowManufacturingPurchaseOrder = row.closest(idTableMain + ' > tbody > tr');
        let divPriceGrandTotalLocalVatIncl = rowManufacturingPurchaseOrder.querySelector('td.' + flagPriceTotalLocalVatIncl + ' div');
        let inputsPriceTotalLocalVatIncl = rowManufacturingPurchaseOrder.querySelectorAll('td.' + flagOrderItems + ' td.' + flagPriceTotalLocalVatIncl + ' input');
        let priceGrandTotalLocalVatIncl = Array.from(inputsPriceTotalLocalVatIncl).reduce((acc, input) => acc + Number(DOM.getElementValueCurrent(input)), 0);
        DOM.setElementValueCurrent(divPriceGrandTotalLocalVatIncl, priceGrandTotalLocalVatIncl);
    }
    hookupFieldsOrderItemPriceUnitLocalVatExcl() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagPriceUnitLocalVatExcl + ' input');
    }
    hookupFieldsOrderItemPriceUnitLocalVatIncl() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagPriceUnitLocalVatIncl + ' input');
    }
    */
    hookupFieldsOrderItemUnitMeasurementLatencyManufacture() {
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagOrderItems + ' td.' + flagUnitMeasurementLatencyManufacture, Utils.getListFromDict(unitMeasurementsTime));
    }
    hookupFieldsOrderItemLatencyManufacture() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagLatencyManufacture + ' input');
    }
    hookupFieldsOrderItemActive() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' input.' + flagActive);
    }
    hookupFieldsOrderItemAddDelete() {
        let selectorButton = idTableMain + ' td.' + flagOrderItems + ' td.' + flagOrderItems + ' button';
        let selectorButtonDelete = selectorButton + '.' + flagDelete;
        let selectorButtonUndelete = selectorButton + '.' + flagAdd;
        this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete);
        this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete);
        this.hookupButtonsOrderItemAdd();
    }
    hookupButtonsOrderItemAdd() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagOrderItems + ' th button.' + flagAdd, (event, element) => {
            let row = element.closest(idTableMain + ' > tbody > tr');
            let idManufacturingPurchaseOrder = row.getAttribute(attrIdManufacturingPurchaseOrder);
            // let hasActiveOrderItem = row.querySelectorAll('td.' + flagOrderItems + ' input.' + flagActive + ':checked').length > 0;
            let countManufacturingOrderItems = row.querySelectorAll('td.' + flagOrderItems + ' td.' + flagManufacturingPurchaseOrder).length;
            let manufacturingPurchaseOrderItem = {
                [attrIdManufacturingPurchaseOrder]: idManufacturingPurchaseOrder,
                [attrIdManufacturingPurchaseOrderProductLink]: -1 - countManufacturingOrderItems,
                [attrIdProductCategory]: 0,
                [attrIdProduct]: 0,
                [flagProductVariations]: '',
                [attrIdUnitMeasurementQuantity]: 0,
                [flagQuantityUsed]: '',
                [flagQuantityProduced]: '',
                [attrIdUnitMeasurementLatencyManufacture]: 0,
                [flagLatencyManufacture]: '',
                [flagDisplayOrder]: countManufacturingOrderItems + 1,
                [flagActive]: true, // !hasActiveOrderItem,
            };
            let tbody = row.querySelector('td.' + flagOrderItems + ' table tbody');
            this.addRowManufacturingPurchaseOrderItem(tbody, manufacturingPurchaseOrderItem);
            /*
            if (!hasActiveOrderItem) {
                let tdOrderItem = row.querySelector('td.' + flagOrderItems);
                // tdOrderItem.setAttribute(attrIdManufacturingOrderItem, manufacturingPurchaseOrderItem[attrIdManufacturingOrderItem]);
                DOM.setElementAttributeValueCurrent(tdOrderItem, manufacturingPurchaseOrderItem[attrIdManufacturingOrderItem]);
            }
            */
            this.hookupOrderItemsFields();
        });
    }

    leave() {
        super.leave();
    }
}

