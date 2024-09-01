// Module for DOM manipulation
export default class DOM {
    static setElementValueCurrent(element, data) {
        element.setAttribute(attrValueCurrent, data);
        if (element.type === "checkbox") {
            element.checked = data;
        }
        else if (element.tagName === 'INPUT' || element.tagName === 'TEXTAREA' || element.tagName === 'SELECT') {
            element.value = data;
        }
        else {
            element.textContent = data;
        }
    }
    static setElementValuePrevious(element, data) {
        element.setAttribute(attrValuePrevious, data);
    }
    static getCellFromElement(element) {
        return element.closest('td');
    }
    static getRowFromElement(element) {
        return element.closest('tr');
    }
    static convertForm2JSON(elementForm) {
        let dataForm = {};
        if (isEmpty(elementForm)) {
            console.log("empty form element");
            return dataForm;
        }
        let containersFilter = elementForm.querySelectorAll('.' + flagContainerInput + '.' + flagFilter);
        console.log("containersFilter: " + containersFilter);
        let containerFilter, labelFilter, keyFilter, filter;
        for (let indexFilter = 0; indexFilter < containersFilter.length; indexFilter++) {
            containerFilter = containersFilter[indexFilter];
            labelFilter = containerFilter.querySelector('label');
            keyFilter = labelFilter.getAttribute('for');
            filter = containerFilter.querySelector(`#${keyFilter}`);
            dataForm[keyFilter] = DOM.getElementValueCurrent(filter);
        }
        return dataForm;
    }
    static loadPageBody(contentNew) {
        let pageBody = document.querySelector(idPageBody);
        pageBody.innerHTML = contentNew;
    }
    static getHashPageCurrent() {
        return document.body.dataset.page;
    }
    static isElementDirty(element) {
        element.setAttribute(attrValueCurrent, DOM.getElementValueCurrent(element));
        let isDirty = element.getAttribute(attrValuePrevious) != element.getAttribute(attrValueCurrent);
        if (isDirty) {
            element.classList.add(flagDirty);
        } else {
            element.classList.remove(flagDirty);
        }
        return isDirty;
    }
    static getElementValueCurrent(element) {
        let returnVal = '';
    
        if (!isEmpty(element)) {
    
            if (element.type === "checkbox") {
                returnVal = element.checked;
            }
            /*
            else if (element.classList.contains(flagIsDatePicker)) {
                returnVal = getDatePickerDate(element, adjust4DayLightSavings);
            }
            */
            else if (element.tagName === 'INPUT' || element.tagName === 'TEXTAREA' || element.tagName === 'SELECT') {
                returnVal = element.value;
            }
            else {
                returnVal = element.textContent;
            }
        }
    
        if (isEmpty(returnVal)) returnVal = '';
    
        return returnVal;
    }
    static isTableElementDirty(element) {
        let isDirty = DOM.isElementDirty(element);
        let cell = DOM.getCellFromElement(element);
        if (isDirty) {
            cell.classList.add(flagDirty);
        } else {
            cell.classList.remove(flagDirty);
        }
    }
    
    /*
    static updateElement(id, data) {
        const element = document.getElementById(id);
        if (element) {
            element.textContent = data;
        }
    }
    */
   
}
