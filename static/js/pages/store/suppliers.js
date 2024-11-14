
import API from "../../api.js";
import BusinessObjects from "../../lib/business_objects/business_objects.js";
import DOM from "../../dom.js";
import Events from "../../lib/events.js";
import TableBasePage from "../base_table.js";
import Utils from "../../lib/utils.js";
import Validation from "../../lib/validation.js";
import StoreTableMixinPage from "./mixin_table.js";

export default class PageStoreSuppliers extends TableBasePage {
    static hash = hashPageStoreSuppliers;
    static attrIdRowObject = attrIdSupplier;
    callSaveTableContent = API.saveSuppliers;

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
        let textareaNameCompany = row.querySelector('td.' + flagNameCompany + ' textarea');
        let textareaNameContact = row.querySelector('td.' + flagNameContact + ' textarea');
        let textareaDepartmentContact = row.querySelector('td.' + flagDepartmentContact + ' textarea');
        let tdAddress = row.querySelector('td.' + flagAddress);
        let textareaPhoneNumber = row.querySelector('td.' + flagPhoneNumber + ' textarea');
        let textareaFax = row.querySelector('td.' + flagFax + ' textarea');
        let textareaEmail = row.querySelector('td.' + flagEmail + ' textarea');
        let textareaWebsite = row.querySelector('td.' + flagWebsite + ' textarea');
        let tdCurrency = row.querySelector('td.' + flagCurrency);
        let buttonActive = row.querySelector(':scope > td.' + flagActive + ' button');

        let jsonRow = {};
        jsonRow[attrIdSupplier] = row.getAttribute(attrIdSupplier);
        jsonRow[flagNameCompany] = DOM.getElementAttributeValueCurrent(textareaNameCompany);
        jsonRow[flagNameContact] = DOM.getElementAttributeValueCurrent(textareaNameContact);
        jsonRow[flagDepartmentContact] = DOM.getElementAttributeValueCurrent(textareaDepartmentContact);
        jsonRow[attrIdSupplierAddress] = DOM.getElementAttributeValueCurrent(tdAddress);
        jsonRow[flagSupplierAddress] = this.getSupplierAddressesFromRow(row);
        jsonRow[flagPhoneNumber] = DOM.getElementAttributeValueCurrent(textareaPhoneNumber);
        jsonRow[flagFax] = DOM.getElementAttributeValueCurrent(textareaFax);
        jsonRow[flagEmail] = DOM.getElementAttributeValueCurrent(textareaEmail);
        jsonRow[flagWebsite] = DOM.getElementAttributeValueCurrent(textareaWebsite);
        jsonRow[attrIdCurrency] = DOM.getElementAttributeValueCurrent(tdCurrency);
        jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
        return jsonRow;
    }
    getSupplierAddressesFromRow(row) {
        let supplierAddresses = [];
        let trs = row.querySelectorAll('td.' + flagAddress + ' tbody tr');
        let address, inputPostcode, inputAddressLine1, inputAddressLine2, inputCity, inputCounty, ddlRegion, inputActive;
        trs.forEach((tr) => {
            inputPostcode = tr.querySelector('td.' + flagPostcode + ' textarea');
            inputAddressLine1 = tr.querySelector('td.' + flagAddressLine1 + ' textarea');
            inputAddressLine2 = tr.querySelector('td.' + flagAddressLine2 + ' textarea');
            inputCity = tr.querySelector('td.' + flagCity + ' textarea');
            inputCounty = tr.querySelector('td.' + flagCounty + ' textarea');
            ddlRegion = tr.querySelector('td.' + flagRegion + ' select');
            inputActive = tr.querySelector('td.' + flagActive + ' input');
            address = {
                [attrIdSupplierAddress]: tr.getAttribute(attrIdSupplierAddress),
                [attrIdSupplier]: row.getAttribute(attrIdSupplier),
                [flagPostcode]: DOM.getElementAttributeValueCurrent(inputPostcode),
                [flagAddressLine1]: DOM.getElementAttributeValueCurrent(inputAddressLine1),
                [flagAddressLine2]: DOM.getElementAttributeValueCurrent(inputAddressLine2),
                [flagCity]: DOM.getElementAttributeValueCurrent(inputCity),
                [flagCounty]: DOM.getElementAttributeValueCurrent(inputCounty),
                [attrIdRegion]: DOM.getElementAttributeValueCurrent(ddlRegion),
                [flagActive]: DOM.getElementAttributeValueCurrent(inputActive),
            };
            supplierAddresses.push(address);
        });
        return supplierAddresses;
    }
    initialiseRowNew(tbody, row) {
        super.initialiseRowNew(tbody, row);
    }

    hookupTableMain() {
        super.hookupTableMain();
        this.hookupNameCompanyInputs();
        this.hookupNameContactInputs();
        this.hookupDepartmentContactInputs();
        this.hookupAddressFields();
        this.hookupPhoneNumberInputs();
        this.hookupFaxInputs();
        this.hookupEmailInputs();
        this.hookupWebsiteInputs();
        this.hookupCurrencyFields();
        this.hookupFieldsActive();
    }
    hookupNameCompanyInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagNameCompany + ' textarea');
    }
    hookupNameContactInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagNameContact + ' textarea');
    }
    hookupDepartmentContactInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDepartmentContact + ' textarea');
    }

    hookupAddressFields() {
        this.hookupAddressPreviews();
        this.hookupAddressPostcodeInputs();
        this.hookupAddressLine1Inputs();
        this.hookupAddressLine2Inputs();
        this.hookupAddressCityInputs();
        this.hookupAddressCountyInputs();
        this.hookupAddressRegionDdls();
        this.hookupAddressActiveCheckboxes();
        this.hookupAddressDeleteButtons();
        this.hookupAddressUndeleteButtons();
        this.hookupAddressAddButtons();
    }
    hookupAddressPreviews() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagAddress, (event, td) => {
            if (!td.classList.contains(flagCollapsed)) return;
            this.handleClickAddressPreview(event, td);
        });
    }
    handleClickAddressPreview(event, element) {
        if (_verbose) { console.log("click address preview"); }
        this.toggleColumnHeaderCollapsed(flagAddress, false);
        element.classList.remove(flagCollapsed);
        let row = DOM.getRowFromElement(element);
        let idSupplier = row.getAttribute(attrIdSupplier);
        let supplierAddressList = idSupplier > 0 ? supplierAddresses[idSupplier] : [];
        let tblAddresses = document.createElement("table");
        tblAddresses.classList.add(flagAddress);
        let thead = document.createElement("thead");
        let tr = document.createElement("tr");
        let thPostcode = document.createElement("th");
        thPostcode.classList.add(flagPostcode);
        thPostcode.textContent = 'Postcode';
        let thAddressLine1 = document.createElement("th");
        thAddressLine1.classList.add(flagAddressLine1);
        thAddressLine1.textContent = 'Address Line 1';
        let thAddressLine2 = document.createElement("th");
        thAddressLine2.classList.add(flagAddressLine2);
        thAddressLine2.textContent = 'Address Line 2';
        let thCity = document.createElement("th");
        thCity.classList.add(flagCity);
        thCity.textContent = 'City';
        let thCounty = document.createElement("th");
        thCounty.classList.add(flagCounty);
        thCounty.textContent = 'County';
        let thRegion = document.createElement("th");
        thRegion.classList.add(flagRegion);
        thRegion.textContent = 'Region';
        let thActive = document.createElement("th");
        thActive.classList.add(flagActive);
        thActive.textContent = 'Active';
        let thAddDelete = document.createElement("th");
        thAddDelete.classList.add(flagAdd);
        let buttonAdd = document.createElement("button");
        buttonAdd.classList.add(flagAdd);
        buttonAdd.textContent = '+';
        thAddDelete.appendChild(buttonAdd);

        tr.appendChild(thPostcode);
        tr.appendChild(thAddressLine1);
        tr.appendChild(thAddressLine2);
        tr.appendChild(thCity);
        tr.appendChild(thCounty);
        tr.appendChild(thRegion);
        tr.appendChild(thActive);
        tr.appendChild(thAddDelete);
        thead.appendChild(tr);
        tblAddresses.appendChild(thead);

        let tbody = document.createElement("tbody");
        let regionOptions = Utils.getListFromDict(regions);
        supplierAddressList.forEach((supplierAddress, index) => {
            this.addRowSupplierAddress(tbody, supplierAddress, regionOptions);
        });
        tblAddresses.appendChild(tbody);
        
        let cell = DOM.getCellFromElement(element);
        let cellNew = cell.cloneNode(false);
        cellNew.appendChild(tblAddresses);
        row.replaceChild(cellNew, cell);
        if (_verbose) { console.log("tblAddresses: ", tblAddresses); }
        this.hookupAddressFields();
    }
    addRowSupplierAddress(tbody, supplierAddress, regionOptions) {
        if (_verbose) { console.log("addRowSupplierAddress: ", supplierAddress); }
        let tdPostcode = document.createElement("td");
        tdPostcode.classList.add(flagPostcode);
        let textareaPostcode = document.createElement("textarea");
        textareaPostcode.classList.add(flagPostcode);
        DOM.setElementValuesCurrentAndPrevious(textareaPostcode, supplierAddress[flagPostcode]);
        tdPostcode.appendChild(textareaPostcode);

        let tdAddressLine1 = document.createElement("td");
        tdAddressLine1.classList.add(flagAddressLine1);
        let textareaAddressLine1 = document.createElement("textarea");
        textareaAddressLine1.classList.add(flagAddressLine1);
        DOM.setElementValuesCurrentAndPrevious(textareaAddressLine1, supplierAddress[flagAddressLine1]);
        tdAddressLine1.appendChild(textareaAddressLine1);

        let tdAddressLine2 = document.createElement("td");
        tdAddressLine2.classList.add(flagAddressLine2);
        let textareaAddressLine2 = document.createElement("textarea");
        textareaAddressLine2.classList.add(flagAddressLine2);
        DOM.setElementValuesCurrentAndPrevious(textareaAddressLine2, supplierAddress[flagAddressLine2]);
        tdAddressLine2.appendChild(textareaAddressLine2);

        let tdCity = document.createElement("td");
        tdCity.classList.add(flagCity);
        let textareaCity = document.createElement("textarea");
        textareaCity.classList.add(flagCity);
        DOM.setElementValuesCurrentAndPrevious(textareaCity, supplierAddress[flagCity]);
        tdCity.appendChild(textareaCity);

        let tdCounty = document.createElement("td");
        tdCounty.classList.add(flagCounty);
        let textareaCounty = document.createElement("textarea");
        textareaCounty.classList.add(flagCounty);
        DOM.setElementValuesCurrentAndPrevious(textareaCounty, supplierAddress[flagCounty]);
        tdCounty.appendChild(textareaCounty);

        let region = supplierAddress[flagRegion];
        if (!region) region = {[attrIdRegion]: ''};
        let tdRegion = document.createElement("td");
        tdRegion.classList.add(flagRegion);
        DOM.setElementAttributesValuesCurrentAndPrevious(tdRegion, region[attrIdRegion]);
        let ddlRegion = document.createElement("select");
        ddlRegion.classList.add(flagRegion);
        let optionJson, option;
        option = DOM.createOption(null);
        ddlRegion.appendChild(option);
        regionOptions.forEach((regionOption) => {
            optionJson = BusinessObjects.getOptionJsonFromObjectJson(regionOption);
            option = DOM.createOption(optionJson);
            ddlRegion.appendChild(option);
        });
        DOM.setElementValuesCurrentAndPrevious(ddlRegion, region[attrIdRegion]);
        tdRegion.appendChild(ddlRegion);

        let tdActive = this.createTdActive(supplierAddress[flagActive]);

        let tr = document.createElement("tr");
        tr.setAttribute(attrIdSupplierAddress, supplierAddress[attrIdSupplierAddress]);
        tr.setAttribute(attrIdSupplier, supplierAddress[attrIdSupplier]);
        tr.appendChild(tdPostcode);
        tr.appendChild(tdAddressLine1);
        tr.appendChild(tdAddressLine2);
        tr.appendChild(tdCity);
        tr.appendChild(tdCounty);
        tr.appendChild(tdRegion);
        tr.appendChild(tdActive);
        tbody.appendChild(tr);
    }
    hookupAddressPostcodeInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' textarea.' + flagPostcode);
    }
    hookupAddressLine1Inputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' textarea.' + flagAddressLine1);
    }
    hookupAddressLine2Inputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' textarea.' + flagAddressLine2);
    }
    hookupAddressCityInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' textarea.' + flagCity);
    }
    hookupAddressCountyInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' textarea.' + flagCounty);
    }
    hookupAddressRegionDdls() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' select.' + flagRegion);
    }
    hookupAddressActiveCheckboxes() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' input.' + flagActive, (event, element) => {
            let rowSupplierAddress = element.closest('tr');
            let idAddress = rowSupplierAddress.getAttribute(attrIdSupplierAddress);
            DOM.setElementAttributeValueCurrent(rowSupplierAddress, idAddress);
            let rowSupplier = rowSupplierAddress.closest(idTableMain + ' > tbody > tr');
            let checkboxesActive = rowSupplier.querySelectorAll('td.' + flagAddress + ' input.' + flagActive);
            let isActive = element.checked;
            if (isActive) {
                checkboxesActive.forEach((checkbox) => {
                    if (checkbox == element) return;
                    DOM.setElementValueCurrent(checkbox, false);
                });
            }
            /*
            else if (checkboxesActive.length > 0) {
                DOM.setElementValueCurrent(checkboxesActive[0], false);
            }
            */
        });
    }
    hookupFieldsAddressAddDelete() {
        let selectorButton = idTableMain + ' td.' + flagAddress + ' button';
        let selectorButtonDelete = selectorButton + '.' + flagDelete;
        let selectorButtonUndelete = selectorButton + '.' + flagAdd;
        this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete);
        this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete);
    }
    hookupAddressDeleteButtons() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagAddress + ' button.' + flagDelete, (event, element) => {
            let row = DOM.getRowFromElement(element);
            row.classList.add(flagDelete);

            let buttonAdd = document.createElement("button");
            buttonAdd.classList.add(flagAdd);
            buttonAdd.textContent = '+';
            element.replaceWith(buttonAdd);
            this.hookupAddressUndeleteButtons();
        });
    }
    hookupAddressUndeleteButtons() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagAddress + ' td button.' + flagAdd, (event, element) => {
            let row = DOM.getRowFromElement(element);
            row.classList.remove(flagDelete);

            let buttonDelete = document.createElement("button");
            buttonDelete.classList.add(flagDelete);
            buttonDelete.textContent = 'x';
            element.replaceWith(buttonDelete);
            this.hookupAddressDeleteButtons();
        });
    }
    hookupAddressAddButtons() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagAddress + ' th button.' + flagAdd, (event, element) => {
            let row = element.closest(idTableMain + ' > tbody > tr');
            let idSupplier = row.getAttribute(attrIdSupplier);
            let hasActiveAddress = row.querySelectorAll('td.' + flagAddress + ' input.' + flagActive + ':checked').length > 0;
            let countSupplierAddresses = row.querySelectorAll('td.' + flagAddress + ' td.' + flagAddress).length;
            let supplierAddress = {
                [attrIdSupplier]: idSupplier,
                [attrIdSupplierAddress]: -1 - countSupplierAddresses,
                [flagPostcode]: '',
                [flagAddressLine1]: '',
                [flagAddressLine2]: '',
                [flagCity]: '',
                [flagCounty]: '',
                [attrIdRegion]: '',
                [flagActive]: !hasActiveAddress,
            };
            let tbody = row.querySelector('td.' + flagAddress + ' table tbody');
            this.addRowSupplierAddress(tbody, supplierAddress, Utils.getListFromDict(regions));
            if (!hasActiveAddress) {
                let tdAddress = row.querySelector('td.' + flagAddress);
                // tdAddress.setAttribute(attrIdSupplierAddress, supplierAddress[attrIdSupplierAddress]);
                DOM.setElementAttributeValueCurrent(tdAddress, supplierAddress[attrIdSupplierAddress]);
            }
            this.hookupAddressFields();
        });
    }

    hookupPhoneNumberInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagPhoneNumber + ' textarea');
    }
    hookupFaxInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagFax + ' textarea');
    }
    hookupEmailInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagEmail + ' textarea');
    }
    hookupWebsiteInputs() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagWebsite + ' textarea');
    }

    leave() {
        super.leave();
    }
}

