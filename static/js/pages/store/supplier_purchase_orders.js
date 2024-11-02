
import API from "../../api.js";
import BusinessObjects from "../../lib/business_objects/business_objects.js";
import DOM from "../../dom.js";
import Events from "../../lib/events.js";
import ProductPermutation from "../../lib/business_objects/store/product_permutation.js";
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
        let trsPurchaseOrderItem = row.querySelectorAll('tr.' + flagOrderItems);
        let checkboxActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');

        let jsonRow = {};
        jsonRow[attrIdSupplierPurchaseOrder] = row.getAttribute(attrIdSupplierPurchaseOrder);
        jsonRow[attrIdSupplier] = DOM.getElementAttributeValueCurrent(tdSupplier);
        jsonRow[attrIdCurrency] = DOM.getElementAttributeValueCurrent(tdCurrency);
        jsonRow[flagCostTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatExcl);
        jsonRow[flagCostTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatIncl);
        // jsonRow[flagOrderItems] = DOM.getElementAttributeValueCurrent(tdItems);
        let orderItems = [];
        if (trsPurchaseOrderItem != null) {
            trsPurchaseOrderItem.forEach((tr) => {
                orderItems.push(this.getJsonRowOrderItem(tr));
            });
        }
        jsonRow[flagOrderItems] = orderItems;
        jsonRow[flagActive] = DOM.getElementAttributeValueCurrent(checkboxActive);
        return jsonRow;
    }
    getJsonRowOrderItem(tr) {
        let inputDisplayOrder = tr.querySelector('td.' + flagDisplayOrder + ' input');
        let tdCategory = tr.querySelector('td.' + flagProductCategory);
        let tdProduct = tr.querySelector('td.' + flagProduct);
        let tdVariations = tr.querySelector('td.' + flagProductVariations);
        let tdUnitQuantity = tr.querySelector('td.' + flagUnitMeasurementQuantity);
        let inputQuantityOrdered = tr.querySelector('td.' + flagQuantityOrdered + ' input');
        let inputQuantityReceived = tr.querySelector('td.' + flagQuantityReceived + ' input');
        let inputCostTotalLocalVatExcl = tr.querySelector('td.' + flagCostTotalLocalVatExcl + ' input');
        let inputCostTotalLocalVatIncl = tr.querySelector('td.' + flagCostTotalLocalVatIncl + ' input');
        let inputLatencyDeliveryDays = tr.querySelector('td.' + flagLatencyDeliveryDays + ' input');
        let checkboxActive = tr.querySelector('td.' + flagActive + ' input');

        let jsonRow = {};
        jsonRow[attrIdSupplierPurchaseOrder] = tr.getAttribute(attrIdSupplierPurchaseOrder);
        jsonRow[attrIdSupplierPurchaseOrderProductLink] = tr.getAttribute(attrIdSupplierPurchaseOrderProductLink);
        jsonRow[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(inputDisplayOrder);
        jsonRow[attrIdProductCategory] = DOM.getElementAttributeValueCurrent(tdCategory);
        jsonRow[attrIdProduct] = DOM.getElementAttributeValueCurrent(tdProduct);
        jsonRow[flagProductVariations] = DOM.getElementAttributeValueCurrent(tdVariations);
        jsonRow[attrIdUnitMeasurementQuantity] = DOM.getElementAttributeValueCurrent(tdUnitQuantity);
        jsonRow[flagQuantityOrdered] = DOM.getElementAttributeValueCurrent(inputQuantityOrdered);
        jsonRow[flagQuantityReceived] = DOM.getElementAttributeValueCurrent(inputQuantityReceived);
        jsonRow[flagCostTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatExcl);
        jsonRow[flagCostTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatIncl);
        jsonRow[flagLatencyDeliveryDays] = DOM.getElementAttributeValueCurrent(inputLatencyDeliveryDays);
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
        this.hookupInputsActiveTable();
    }
    hookupSupplierFields() {
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagSupplier, Utils.getListFromDict(suppliers));
    }
    hookupCostInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatExcl + ' input');
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatIncl + ' input');
    }
    hookupOrderItemsFields() {
        this.hookupOrderItemsPreviews();
        this.hookupFieldsOrderItemDisplayOrder();
        this.hookupFieldsOrderItemProductCategory();
        this.hookupFieldsOrderItemProduct();
        // this.hookupFieldsOrderItemProductVariations();
        this.hookupFieldsProductPermutationVariation();
        this.hookupFieldsOrderItemUnitQuantity();
        this.hookupFieldsOrderItemQuantityOrdered();
        this.hookupFieldsOrderItemQuantityReceived();
        this.hookupFieldsOrderItemCostTotalLocalVatExcl();
        this.hookupFieldsOrderItemCostTotalLocalVatIncl();
        this.hookupFieldsOrderItemLatencyDeliveryDays();
        this.hookupFieldsOrderItemActive();
        this.hookupFieldsOrderItemAddDelete();
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
        let idSupplierPurchaseOrder = row.getAttribute(attrIdSupplierPurchaseOrder);
        if (idSupplierPurchaseOrder == null || idSupplierPurchaseOrder < 1) return;
        let supplierPurchaseOrder = supplierPurchaseOrders[idSupplierPurchaseOrder];
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
        let thQuantityOrdered = document.createElement("th");
        thQuantityOrdered.classList.add(flagQuantityOrdered);
        thQuantityOrdered.textContent = 'Quantity Ordered';
        let thQuantityReceived = document.createElement("th");
        thQuantityReceived.classList.add(flagQuantityReceived);
        thQuantityReceived.textContent = 'Quantity Received';
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
        let thLatencyDeliveryDays = document.createElement("th");
        thLatencyDeliveryDays.classList.add(flagLatencyDeliveryDays);
        thLatencyDeliveryDays.textContent = 'Latency Delivery (Days)';
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
        tr.appendChild(thQuantityOrdered);
        tr.appendChild(thQuantityReceived);
        tr.appendChild(thCostTotalLocalVatExcl);
        tr.appendChild(thCostTotalLocalVatIncl);
        tr.appendChild(thCostUnitLocalVatExcl);
        tr.appendChild(thCostUnitLocalVatIncl);
        tr.appendChild(thLatencyDeliveryDays);
        tr.appendChild(thActive);
        tr.appendChild(thAddDelete);
        thead.appendChild(tr);
        tblOrderItems.appendChild(thead);

        let tbody = document.createElement("tbody");
        supplierPurchaseOrder[flagOrderItems].forEach((orderItem, index) => {
            this.addRowSupplierPurchaseOrderItem(tbody, orderItem);
        });
        tblOrderItems.appendChild(tbody);
        
        let cell = DOM.getCellFromElement(element);
        let cellNew = cell.cloneNode(false);
        cellNew.appendChild(tblOrderItems);
        row.replaceChild(cellNew, cell);
        if (_verbose) { console.log("tblOrderItems: ", tblOrderItems); }
        this.hookupOrderItemsFields();
    }
    addRowSupplierPurchaseOrderItem(tbody, orderItem) { //  productVariationTypeOptions, productVariationOptions, productCategoryOptions, productOptions, unitMeasurementOptions, 
        if (_verbose) { console.log("addRowSupplierPurchaseOrderItem: ", orderItem); }

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
        DOM.setElementAttributesValuesCurrentAndPrevious(divCategory, orderItem[attrIdProductCategory]);
        // divCategory.textContent = orderItem[flagProductCategory];
        let productCategory = productCategories[orderItem[attrIdProductCategory]];
        divCategory.textContent = BusinessObjects.getObjectText(productCategory);
        tdCategory.appendChild(divCategory);

        let tdProduct = document.createElement("td");
        tdProduct.classList.add(flagProduct);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdProduct, orderItem[attrIdProduct]);
        let divProduct = document.createElement("div");
        divProduct.classList.add(flagProduct);
        DOM.setElementAttributesValuesCurrentAndPrevious(divProduct, orderItem[attrIdProduct]);
        // divProduct.textContent = orderItem[flagProduct];
        let product = products[orderItem[attrIdProduct]];
        divProduct.textContent = BusinessObjects.getObjectText(product);
        tdProduct.appendChild(divProduct);

        let tdVariations = document.createElement("td");
        tdVariations.classList.add(flagProductVariations);
        tdVariations.classList.add(flagCollapsed);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdVariations, orderItem[attrIdProductVariation]);
        let divVariations = document.createElement("div");
        divVariations.classList.add(flagProductVariations);
        DOM.setElementAttributesValuesCurrentAndPrevious(divVariations, orderItem[attrIdProductVariation]);
        // divVariations.textContent = orderItem[flagProductVariations];
        let variationsText = ProductPermutation.getProductVariationsPreviewFromIdCsv(orderItem[flagProductVariations]);
        divVariations.textContent = variationsText;
        tdVariations.appendChild(divVariations);

        let tdUnitQuantity = document.createElement("td");
        tdUnitQuantity.classList.add(flagUnitMeasurementQuantity);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdUnitQuantity, orderItem[attrIdUnitMeasurementQuantity]);
        let divUnitQuantity = document.createElement("div");
        divUnitQuantity.classList.add(flagUnitMeasurementQuantity);
        DOM.setElementAttributesValuesCurrentAndPrevious(divUnitQuantity, orderItem[attrIdUnitMeasurementQuantity]);
        let unitQuantity = unitMeasurements[orderItem[attrIdUnitMeasurementQuantity]];
        divUnitQuantity.textContent = BusinessObjects.getObjectText(unitQuantity);
        tdUnitQuantity.appendChild(divUnitQuantity);

        let tdQuantityOrdered = document.createElement("td");
        tdQuantityOrdered.classList.add(flagQuantityOrdered);
        let inputQuantityOrdered = document.createElement("input");
        inputQuantityOrdered.classList.add(flagQuantityOrdered);
        inputQuantityOrdered.type = 'number';
        DOM.setElementValuesCurrentAndPrevious(inputQuantityOrdered, orderItem[flagQuantityOrdered]);
        tdQuantityOrdered.appendChild(inputQuantityOrdered);

        let tdQuantityReceived = document.createElement("td");
        tdQuantityReceived.classList.add(flagQuantityReceived);
        let inputQuantityReceived = document.createElement("input");
        inputQuantityReceived.classList.add(flagQuantityReceived);
        inputQuantityReceived.type = 'number';
        DOM.setElementValuesCurrentAndPrevious(inputQuantityReceived, orderItem[flagQuantityReceived]);
        tdQuantityReceived.appendChild(inputQuantityReceived);

        let tdCostTotalLocalVatExcl = document.createElement("td");
        tdCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
        let inputCostTotalLocalVatExcl = document.createElement("input");
        inputCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
        inputCostTotalLocalVatExcl.type = 'number';
        inputCostTotalLocalVatExcl.step = 0.01;
        DOM.setElementValuesCurrentAndPrevious(inputCostTotalLocalVatExcl, orderItem[flagCostTotalLocalVatExcl]);
        tdCostTotalLocalVatExcl.appendChild(inputCostTotalLocalVatExcl);

        let tdCostTotalLocalVatIncl = document.createElement("td");
        tdCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
        let inputCostTotalLocalVatIncl = document.createElement("input");
        inputCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
        inputCostTotalLocalVatIncl.type = 'number';
        inputCostTotalLocalVatIncl.step = 0.01;
        DOM.setElementValuesCurrentAndPrevious(inputCostTotalLocalVatIncl, orderItem[flagCostTotalLocalVatIncl]);
        tdCostTotalLocalVatIncl.appendChild(inputCostTotalLocalVatIncl);

        let tdCostUnitLocalVatExcl = document.createElement("td");
        tdCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
        let divCostUnitLocalVatExcl = document.createElement("div");
        divCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
        DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatExcl, orderItem[flagCostUnitLocalVatExcl].toFixed(3));
        tdCostUnitLocalVatExcl.appendChild(divCostUnitLocalVatExcl);

        let tdCostUnitLocalVatIncl = document.createElement("td");
        tdCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
        let divCostUnitLocalVatIncl = document.createElement("div");
        divCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
        DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatIncl, orderItem[flagCostUnitLocalVatIncl].toFixed(3));
        tdCostUnitLocalVatIncl.appendChild(divCostUnitLocalVatIncl);

        let tdLatencyDeliveryDays = document.createElement("td");
        tdLatencyDeliveryDays.classList.add(flagLatencyDeliveryDays);
        let inputLatencyDeliveryDays = document.createElement("input");
        inputLatencyDeliveryDays.classList.add(flagLatencyDeliveryDays);
        inputLatencyDeliveryDays.type = 'number';
        inputLatencyDeliveryDays.step = 1;
        DOM.setElementValuesCurrentAndPrevious(inputLatencyDeliveryDays, orderItem[flagLatencyDeliveryDays]);
        tdLatencyDeliveryDays.appendChild(inputLatencyDeliveryDays);

        let tdActive = document.createElement("td");
        tdActive.classList.add(flagActive);
        let checkboxActive = document.createElement("input");
        checkboxActive.classList.add(flagActive);
        checkboxActive.type = 'checkbox';
        DOM.setElementValuesCurrentAndPrevious(checkboxActive, orderItem[flagActive]);
        tdActive.appendChild(checkboxActive);

        let tdDelete = document.createElement("td");
        tdDelete.classList.add(flagDelete);
        let buttonDelete = document.createElement("button");
        buttonDelete.classList.add(flagDelete);
        buttonDelete.textContent = 'x';
        tdDelete.appendChild(buttonDelete);

        let tr = document.createElement("tr");
        tr.classList.add(flagOrderItems);
        tr.setAttribute(attrIdSupplierPurchaseOrder, orderItem[attrIdSupplierPurchaseOrder]);
        tr.setAttribute(attrIdSupplierPurchaseOrderProductLink, orderItem[attrIdSupplierPurchaseOrderProductLink]);
        tr.appendChild(tdDisplayOrder);
        tr.appendChild(tdCategory);
        tr.appendChild(tdProduct);
        tr.appendChild(tdVariations);
        tr.appendChild(tdUnitQuantity);
        tr.appendChild(tdQuantityOrdered);
        tr.appendChild(tdQuantityReceived);
        tr.appendChild(tdCostTotalLocalVatExcl);
        tr.appendChild(tdCostTotalLocalVatIncl);
        tr.appendChild(tdCostUnitLocalVatExcl);
        tr.appendChild(tdCostUnitLocalVatIncl);
        tr.appendChild(tdLatencyDeliveryDays);
        tr.appendChild(tdActive);
        tr.appendChild(tdDelete);
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
    /*
    hookupFieldsOrderItemProductVariations() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagOrderItems + ' td.' + flagProductVariations, (event, element) => this.handleClickProductPermutationVariationsPreview(event, element));
    }
    */
    hookupDdlsProductPermutationVariation() {
        this.hookupTableCellDdls(idTableMain + ' td.' + flagProductVariations + ' td.' + flagProductVariation);
    }
    hookupDdlsProductPermutationVariationType() {
        this.hookupTableCellDdls(idTableMain + ' td.' + flagProductVariations + ' td.' + flagProductVariationType);
    }
    hookupFieldsOrderItemUnitQuantity() {
        this.hookupTableCellDdlPreviews(
            idTableMain + ' td.' + flagOrderItems + ' td.' + flagUnitMeasurementQuantity
            , Utils.getListFromDict(unitMeasurements)
        );
    }
    hookupFieldsOrderItemQuantityOrdered() {
        this.hookupChangeHandlerTableCells(
            idTableMain + ' td.' + flagOrderItems + ' td.' + flagQuantityOrdered + ' input'
        );
    }
    hookupFieldsOrderItemQuantityReceived() {
        this.hookupChangeHandlerTableCells(
            idTableMain + ' td.' + flagOrderItems + ' td.' + flagQuantityReceived + ' input'
        );
    }
    hookupFieldsOrderItemCostTotalLocalVatExcl() {
        this.hookupChangeHandlerTableCells(
            idTableMain + ' td.' + flagOrderItems + ' td.' + flagCostTotalLocalVatExcl + ' input'
            , (event, element) => { 
                this.handleChangeNestedElementCellTable(event, element); //  flagCostTotalLocalVatExcl);
                this.updateFieldsCostUnitLocalVatExcl(element);
            }
        );
    }
    hookupFieldsOrderItemCostTotalLocalVatIncl() {
        this.hookupChangeHandlerTableCells(
            idTableMain + ' td.' + flagOrderItems + ' td.' + flagCostTotalLocalVatIncl + ' input' 
            , (event, element) => { 
                this.handleChangeNestedElementCellTable(event, element); //  flagCostTotalLocalVatIncl);
                this.updateFieldsCostUnitLocalVatIncl(element);
            }
        );
    }
    updateFieldsCostUnitLocalVatExcl(elementChanged) {
        let row = elementChanged.closest('tr.' + flagOrderItems);
        let inputCostTotalLocalVatExcl = row.querySelector('td.' + flagCostTotalLocalVatExcl + ' input');
        let costTotalLocalVatExcl = DOM.getElementValueCurrent(inputCostTotalLocalVatExcl);
        let inputQuantityOrdered = row.querySelector('td.' + flagQuantityOrdered + ' input');
        let quantityOrdered = DOM.getElementValueCurrent(inputQuantityOrdered);

        let divCostUnitLocalVatExcl = row.querySelector('td.' + flagCostUnitLocalVatExcl + ' div');
        let costUnitLocalVatExcl = quantityOrdered == 0 ? 0 : costTotalLocalVatExcl / quantityOrdered;
        DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatExcl, costUnitLocalVatExcl.toFixed(3));

        let rowSupplierPurchaseOrder = row.closest(idTableMain + ' > tbody > tr');
        let divCostGrandTotalLocalVatExcl = rowSupplierPurchaseOrder.querySelector('td.' + flagCostTotalLocalVatExcl + ' div');
        let inputsCostTotalLocalVatExcl = rowSupplierPurchaseOrder.querySelectorAll('td.' + flagOrderItems + ' td.' + flagCostTotalLocalVatExcl + ' input');
        let costGrandTotalLocalVatExcl = Array.from(inputsCostTotalLocalVatExcl).reduce((acc, input) => acc + Number(DOM.getElementValueCurrent(input)), 0);
        DOM.setElementValueCurrent(divCostGrandTotalLocalVatExcl, costGrandTotalLocalVatExcl);
    }
    updateFieldsCostUnitLocalVatIncl(elementChanged) {
        let row = elementChanged.closest('tr.' + flagOrderItems);
        let inputCostTotalLocalVatIncl = row.querySelector('td.' + flagCostTotalLocalVatIncl + ' input');
        let costTotalLocalVatIncl = DOM.getElementValueCurrent(inputCostTotalLocalVatIncl);
        let inputQuantityOrdered = row.querySelector('td.' + flagQuantityOrdered + ' input');
        let quantityOrdered = DOM.getElementValueCurrent(inputQuantityOrdered);

        let divCostUnitLocalVatIncl = row.querySelector('td.' + flagCostUnitLocalVatIncl + ' div');
        let costUnitLocalVatIncl = quantityOrdered == 0 ? 0 : costTotalLocalVatIncl / quantityOrdered;
        DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatIncl, costUnitLocalVatIncl.toFixed(3));

        let rowSupplierPurchaseOrder = row.closest(idTableMain + ' > tbody > tr');
        let divCostGrandTotalLocalVatIncl = rowSupplierPurchaseOrder.querySelector('td.' + flagCostTotalLocalVatIncl + ' div');
        let inputsCostTotalLocalVatIncl = rowSupplierPurchaseOrder.querySelectorAll('td.' + flagOrderItems + ' td.' + flagCostTotalLocalVatIncl + ' input');
        let costGrandTotalLocalVatIncl = Array.from(inputsCostTotalLocalVatIncl).reduce((acc, input) => acc + Number(DOM.getElementValueCurrent(input)), 0);
        DOM.setElementValueCurrent(divCostGrandTotalLocalVatIncl, costGrandTotalLocalVatIncl);
    }
    hookupFieldsOrderItemLatencyDeliveryDays() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagLatencyDeliveryDays + ' input');
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
            let idSupplierPurchaseOrder = row.getAttribute(attrIdSupplierPurchaseOrder);
            // let hasActiveOrderItem = row.querySelectorAll('td.' + flagOrderItems + ' input.' + flagActive + ':checked').length > 0;
            let countSupplierOrderItems = row.querySelectorAll('td.' + flagOrderItems + ' td.' + flagSupplierPurchaseOrder).length;
            let supplierOrderItem = {
                [attrIdSupplierPurchaseOrder]: idSupplierPurchaseOrder,
                [attrIdSupplierPurchaseOrderProductLink]: -1 - countSupplierOrderItems,
                [attrIdProductCategory]: 0,
                [attrIdProduct]: 0,
                [flagProductVariations]: '',
                [attrIdUnitMeasurementQuantity]: 0,
                [flagQuantityOrdered]: '',
                [flagQuantityReceived]: '',
                [flagCostTotalLocalVatExcl]: '',
                [flagCostTotalLocalVatIncl]: '',
                [flagCostUnitLocalVatExcl]: '',
                [flagCostUnitLocalVatIncl]: '',
                [flagLatencyDeliveryDays]: '',
                [flagDisplayOrder]: countSupplierOrderItems + 1,
                [flagActive]: true, // !hasActiveOrderItem,
            };
            let tbody = row.querySelector('td.' + flagOrderItems + ' table tbody');
            this.addRowSupplierPurchaseOrderItem(tbody, supplierOrderItem);
            /*
            if (!hasActiveOrderItem) {
                let tdOrderItem = row.querySelector('td.' + flagOrderItems);
                // tdOrderItem.setAttribute(attrIdSupplierOrderItem, supplierOrderItem[attrIdSupplierOrderItem]);
                DOM.setElementAttributeValueCurrent(tdOrderItem, supplierOrderItem[attrIdSupplierPurchaseOrderProductLink]);
            }
            */
            this.hookupOrderItemsFields();
        });
    }
    
    leave() {
        super.leave();
    }
}

