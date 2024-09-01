var _rowBlank = null;

import { PageBase } from "./page_base.js";
import API from "../api.js";
import DOM from "../dom.js";

export class PageStoreProductCategories extends PageBase {
    static hash = hashPageStoreProductCategories;

    constructor() {
        super();
    }

    initialize() {
        this.sharedInitialize();
        this.hookupFilters();
        this.hookupButtonsAddSaveCancel();
        this.hookupTableMain();
        hookupOverlayConfirm(() => {
            this.leave();
            this.saveCategories();
        });
    }

    hookupFilters() {        
        this.hookupFilterIsNotEmpty();
        this.hookupFilterActive();
        this.hookupButtonApplyFilters();
    }

    hookupFilterIsNotEmpty() {
        initialiseEventHandler('.' + flagIsNotEmpty, flagInitialised, (filter) => {
            filter.addEventListener("change", (event) => {
                PageStoreProductCategories.isDirtyFilter(filter);
            });
        });
    }

    hookupFilterActive() {
        initialiseEventHandler('.' + flagActive, flagInitialised, (filter) => {
            filter.addEventListener("change", (event) => {
                PageStoreProductCategories.isDirtyFilter(filter);
            });
        });
    }

    hookupButtonApplyFilters() {
        initialiseEventHandler(idButtonApplyFilters, flagInitialised, (button) => {
            button.addEventListener("click", (event) => {
                event.stopPropagation();
                this.loadCategories();
            });
        });
    }

    loadCategories() {

        let elForm = document.querySelector(idFormFiltersProductCategory);
        API.getCategoriesByFilters(elForm)
            .then(data => {
                console.log('Data received:', data);
                this.callbackLoadCategories(data);
            })
            .catch(error => console.error('Error:', error));
    }

    callbackLoadCategories(response) {
        
        console.log('ajax:'); console.log(response);

        let table = document.querySelector(idTableMain);
        let row, sliderDisplayOrder, textareaCode, textareaName, textareaDescription, inputActive;

        // table.querySelector('tr').remove(); // :not(.' + flagRowNew + ')
        let bodyTable = table.querySelector('tbody');
        bodyTable.querySelectorAll('tr').forEach(function(row) { row.remove(); });

        let categories = response.data.categories.sort((a, b) => a.display_order - b.display_order);
        
        categories.forEach((category) => {
            row = _rowBlank.cloneNode(true);
            row.classList.remove(flagRowNew);
            row.classList.remove(flagInitialised);
            row.querySelectorAll('.' + flagInitialised).forEach(function(element) {
                element.classList.remove(flagInitialised);
            });
            console.log("applying data row: ", category);
            sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
            textareaCode = row.querySelector('td.' + flagCode + ' textarea');
            textareaName = row.querySelector('td.' + flagName + ' textarea');
            textareaDescription = row.querySelector('td.' + flagDescription + ' textarea');
            inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');
            sliderDisplayOrder.setAttribute(attrValueCurrent, category[flagDisplayOrder]);
            DOM.setElementValuePrevious(sliderDisplayOrder, category[flagDisplayOrder]);
            DOM.setElementValueCurrent(textareaCode, category[flagCode]);
            DOM.setElementValuePrevious(textareaCode, category[flagCode]);
            DOM.setElementValueCurrent(textareaName, category[flagName]);
            DOM.setElementValuePrevious(textareaName, category[flagName]);
            DOM.setElementValueCurrent(textareaDescription, category[flagDescription]);
            DOM.setElementValuePrevious(textareaDescription, category[flagDescription]);
            DOM.setElementValueCurrent(inputActive, category[flagActive]);
            DOM.setElementValuePrevious(inputActive, category[flagActive]);
            row.setAttribute(attrIdCategory, category[attrIdCategory]);
            bodyTable.appendChild(row);
        });

        this.hookupTableMain();
    }

    hookupButtonsAddSaveCancel() {
        this.hookupButtonSave();

        initialiseEventHandler('form.' + flagFilter + ' button.' + flagCancel, flagInitialised, function(button) {
            button.addEventListener("click", function(event) {
                event.stopPropagation();
                loadCategories();
            });
            button.classList.add(flagCollapsed);
        });

        initialiseEventHandler('form.' + flagFilter + ' button.' + flagAdd, flagInitialised, (button) => {
            button.addEventListener("click", (event) => {
                event.stopPropagation();
                let tbody = document.querySelector(idTableMain + ' tbody');
                let row = _rowBlank.cloneNode(true);
                row.classList.remove(flagInitialised);
                row.querySelectorAll('.' + flagInitialised).forEach(function(element) {
                    element.classList.remove(flagInitialised);
                });
                let newDisplayOrder = parseInt(tbody.querySelector('tr:last-child').querySelector('td.' + flagDisplayOrder + ' .' + flagSlider).getAttribute(attrValueCurrent)) + 1;
                tbody.appendChild(row);
                let slider = tbody.querySelector('tr:last-child').querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
                slider.setAttribute(attrValueCurrent, newDisplayOrder);
                slider.setAttribute(attrValuePrevious, newDisplayOrder);
                this.hookupTableMain();
            });
        });
    }

    saveCategories() {

        let categories = this.getCategories(true);
        
        if (categories.length == 0) {
            showOverlayError('No categories to save');
            return;
        }
        
        let elForm = document.querySelector(idFormFiltersProductCategory);
        let comment = DOM.getElementValueCurrent(document.querySelector(idTextareaConfirm)); // idOverlayConfirm + ' ' + textarea
        API.saveCategories(categories, elForm, comment)
            .then(data => {
                console.log('Data received:', data);
                this.callbackLoadCategories(data);
                console.log('Categories saved?');
            })
            .catch(error => console.error('Error:', error));
    }

    getCategories(dirtyOnly) {
        let table = document.querySelector(idTableMain);
        let categories = [];
        let category, sliderDisplayOrder, textareaCode, textareaName, textareaDescription, inputActive;
        table.querySelectorAll('tbody tr').forEach(function(row) {
            if (dirtyOnly && !row.classList.contains(flagDirty)) return;

            sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
            textareaCode = row.querySelector('td.' + flagCode + ' textarea');
            textareaName = row.querySelector('td.' + flagName + ' textarea');
            textareaDescription = row.querySelector('td.' + flagDescription + ' textarea');
            inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');

            category = {};
            category[attrIdCategory] = row.getAttribute(attrIdCategory);
            category[flagCode] = DOM.getElementValueCurrent(textareaCode);
            category[flagName] = DOM.getElementValueCurrent(textareaName);
            category[flagDescription] = DOM.getElementValueCurrent(textareaDescription);
            category[flagActive] = DOM.getElementValueCurrent(inputActive);
            category[flagDisplayOrder] = sliderDisplayOrder.getAttribute(attrValueCurrent);
            categories.push(category);
        });
        return categories;
    }

    hookupTableMain() {
        this.hookupSlidersDisplayOrder();
        this.hookupTextareasCode();
        this.hookupTextareasName();
        this.hookupTextareasDescription();
        this.hookupInputsActive();
        if (_rowBlank == null) {
            this.cacheRowBlank();
        }
    }
    hookupSlidersDisplayOrder() {
        let selectorDisplayOrder = idTableMain + ' tbody tr td.' + flagDisplayOrder;
        initialiseEventHandler(selectorDisplayOrder, flagInitialised, (sliderDisplayOrder) => {
            sliderDisplayOrder.addEventListener('mousedown', (event) => {
                this.handleSliderMouseDown(event);
            });
        });
    }
    hookupTextareasCode() {
        let selectorCode = idTableMain + ' tbody tr td.' + flagCode + ' textarea';
        initialiseEventHandler(selectorCode, flagInitialised, (textareaCode) => {
            textareaCode.addEventListener("change", (event) => {
                console.log("textarea change event");
                this.handleChangeInputCategories(textareaCode);
            });
        });
    }
    hookupTextareasName() {
        let selectorName = idTableMain + ' tbody tr td.' + flagName + ' textarea';
        initialiseEventHandler(selectorName, flagInitialised, (textareaName) => {
            textareaName.addEventListener("change", (event) => {
                console.log("textarea change event");
                this.handleChangeInputCategories(textareaName);
            });
        });
    }
    hookupTextareasDescription() {
        let selectorDescription = idTableMain + ' tbody tr td.' + flagDescription + ' textarea';
        initialiseEventHandler(selectorDescription, flagInitialised, (textareaDescription) => {
            textareaDescription.addEventListener("change", (event) => {
                console.log("textarea change event");
                this.handleChangeInputCategories(textareaDescription);
            });
        });
    }
    hookupInputsActive() {
        let selectorActive = idTableMain + ' tbody tr td.' + flagActive + ' input[type="checkbox"]';
        initialiseEventHandler(selectorActive, flagInitialised, (inputActive) => {
            inputActive.addEventListener("change", (event) => {
                console.log("input change event");
                this.handleChangeInputCategories(inputActive);
            });
        });
    }
    handleSliderMouseDown(event) {
        event.stopPropagation();
        console.log("start drag slider");
        let slider = event.target;
        let initialY = event.clientY;
        let initialRow = DOM.getRowFromElement(slider);
        let placeholder = document.createElement('tr');
        placeholder.className = 'placeholder';
        placeholder.style.height = `${initialRow.offsetHeight}px`;
        initialRow.parentNode.insertBefore(placeholder, initialRow.nextSibling);
        initialRow.style.position = 'absolute';
        initialRow.style.zIndex = '1000';
        initialRow.style.width = `${initialRow.offsetWidth}px`;

        function onMouseMove(event) {
            let newY = event.clientY;
            let deltaY = newY - initialY;
            initialRow.style.transform = `translateY(${deltaY}px)`;

            let rows = Array.from(initialRow.parentNode.children);
            let currentIndex = rows.indexOf(initialRow);
            let placeholderIndex = rows.indexOf(placeholder);

            if (deltaY > 0 && currentIndex < rows.length - 1) {
                let nextRow = rows[currentIndex + 1];
                if (newY > nextRow.getBoundingClientRect().top) {
                    initialRow.parentNode.insertBefore(placeholder, nextRow.nextSibling);
                }
            } else if (deltaY < 0 && currentIndex > 0) {
                let prevRow = rows[currentIndex - 1];
                if (newY < prevRow.getBoundingClientRect().bottom) {
                    initialRow.parentNode.insertBefore(placeholder, prevRow);
                }
            }
        }

        function onMouseUp() {
            initialRow.style.position = '';
            initialRow.style.zIndex = '';
            initialRow.style.transform = '';
            placeholder.parentNode.insertBefore(initialRow, placeholder);
            placeholder.remove();
            document.removeEventListener('mousemove', onMouseMove);
            document.removeEventListener('mouseup', onMouseUp);
        }

        document.addEventListener('mousemove', onMouseMove);
        document.addEventListener('mouseup', onMouseUp);
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

    handleChangeInputCategories(element) {
        console.log("handleChangeInputCategories");
        console.log("element value:", DOM.getElementValueCurrent(element));
        let row = DOM.getRowFromElement(element);
        let wasDirtyRow = this.isRowDirty(row);
        let wasDirty = element.classList.contains(flagDirty);
        let isDirty = DOM.isElementDirty(element);
        if (isDirty != wasDirty) {
            let isDirtyRow = this.isRowDirty(row);
            if (isDirtyRow != wasDirtyRow) {
                let categoriesDirty = this.getCategories(true);
                let existsDirtyCategory = categoriesDirty.length > 0;
                console.log("categoriesDirty:", categoriesDirty);
                console.log("existsDirtyCategory:", existsDirtyCategory);
                this.toggleShowButtonsSaveCancel(existsDirtyCategory);
            }
        }
    }

    isRowDirty(row) {
        let sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder);
        let inputCode = row.querySelector('td.' + flagCode + ' textarea');
        let inputName = row.querySelector('td.' + flagName + ' textarea');
        let inputDescription = row.querySelector('td.' + flagDescription + ' textarea');
        let inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');
        let isDirty = sliderDisplayOrder.classList.contains(flagDirty) || inputCode.classList.contains(flagDirty) || inputName.classList.contains(flagDirty) || 
            inputDescription.classList.contains(flagDirty) || inputActive.classList.contains(flagDirty);
        if (isDirty) {
            row.classList.add(flagDirty);
        } else {
            row.classList.remove(flagDirty);
        }
        return isDirty;
    }

    leave() {
        super.leave();
    }

    getFiltersDefaults() {
        return {
            [flagIsNotEmpty]: true,
            [flagActive]: true
        };
    }
}

