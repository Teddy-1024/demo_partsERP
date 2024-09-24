
import Validation from "./lib/validation.js";

// Module for DOM manipulation
export default class DOM {
    static setElementAttributesValuesCurrentAndPrevious(element, data) {
        DOM.setElementAttributeValueCurrent(element, data);
        DOM.setElementAttributeValuePrevious(element, data);
    }
    static setElementAttributeValueCurrent(element, data) {
        element.setAttribute(attrValueCurrent, data);
    }
    static setElementAttributeValuePrevious(element, data) {
        element.setAttribute(attrValuePrevious, data);
    }
    static setElementValuesCurrentAndPrevious(element, data) {
        DOM.setElementValueCurrent(element, data);
        DOM.setElementAttributeValuePrevious(element, data);
    }
    static setElementValueCurrent(element, data) {
        DOM.setElementAttributeValueCurrent(element, data);
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
    static setElementValueCurrentIfEmpty(element, data) {
        if (Validation.isEmpty(DOM.getElementValueCurrent(element))) {
            DOM.setElementValueCurrent(element, data);
        }
    }
    static getCellFromElement(element) {
        return element.closest('td');
    }
    static getRowFromElement(element) {
        return element.closest('tr');
    }
    static convertForm2JSON(elementForm) {
        let dataForm = {};
        if (Validation.isEmpty(elementForm)) {
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
        const hashPageCurrent = document.body.dataset.page;
        return hashPageCurrent;
    }
    static updateAndCheckIsElementDirty(element) {
        element.setAttribute(attrValueCurrent, DOM.getElementValueCurrent(element));
        return DOM.isElementDirty(element);
    }
    static isElementDirty(element) {
        let isDirty = element.getAttribute(attrValuePrevious) != element.getAttribute(attrValueCurrent);
        DOM.handleDirtyElement(element, isDirty);
        return isDirty;
    }
    static handleDirtyElement(element, isDirty) {
        DOM.toggleElementHasClassnameFlag(element, isDirty, flagDirty);
    }
    static toggleElementHasClassnameFlag(element, elementHasFlag, flag) {
        let elementAlreadyHasFlag = element.classList.contains(flag);
        if (elementHasFlag == elementAlreadyHasFlag) return;
        if (elementHasFlag) {
            element.classList.add(flag);
        } else {
            element.classList.remove(flag);
        }
    }
    static hasDirtyChildrenContainer(container) {
        if (container == null) return false;
        return container.querySelector('.' + flagDirty) != null;
    }
    static getElementValueCurrent(element) {
        let returnVal = '';
    
        if (!Validation.isEmpty(element)) {
    
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
    
        if (Validation.isEmpty(returnVal)) returnVal = '';
    
        return returnVal;
    }
    static getElementAttributeValueCurrent(element) {
        return element.getAttribute(attrValueCurrent);
    }
    static getElementAttributeValuePrevious(element) {
        return element.getAttribute(attrValuePrevious);
    }
    static updateAndCheckIsTableElementDirty(element) {
        let isDirty = DOM.updateAndCheckIsElementDirty(element);
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
    /* non-static method on page object to use
    static handleChangeElement(element) {}
    */
    static scrollToElement(parent, element) {
        // REQUIRED: parent has scroll-bar
        parent.scrollTop(parent.scrollTop() + (element.offset().top - parent.offset().top));
    }
    static isElementInContainer(container, element) {

        if (typeof jQuery === 'function') {
            if (container instanceof jQuery) container = container[0];
            if (element instanceof jQuery) element = element[0];
        }

        var containerBounds = container.getBoundingClientRect();
        var elementBounds = element.getBoundingClientRect();

        return (
            containerBounds.top <= elementBounds.top &&
            containerBounds.left <= elementBounds.left &&
            ((elementBounds.top + elementBounds.height) <= (containerBounds.top + containerBounds.height)) &&
            ((elementBounds.left + elementBounds.width) <= (containerBounds.left + containerBounds.width))
        );
    }
    static alertError(errorType, errorText) {
        alert(errorType + '\n' + errorText);
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
    static createOption(optionJson) {
        if (Validation.isEmpty(optionJson)) optionJson = {
            text: 'Select',
            value: 0,
        };
        let option = document.createElement('option');
        option.value = optionJson.value;
        option.textContent = optionJson.text;
        option.selected = optionJson.selected;
        return option;
    }
}
