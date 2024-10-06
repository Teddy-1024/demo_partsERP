
import Validation from "../../../lib/validation.js";


// Date picker inputs
/*
function hookupInputDatePickers(dateInputs, notFuture, notPast, parent, addClearOption) {

    if (!Validation.isEmpty(dateInputs)) {

        let currentInput, currentDateString, currentDate, exceptionsArray;

        for (let i = 0; i < dateInputs.length; i++) {

            currentInput = document.querySelectorAll(dateInputs[i]);
            currentDateString = currentInput.val();
            currentDate = (!Validation.isEmpty(currentDateString)) ? convertDDMMYYYYString2Date(currentDateString, false) : null;
            exceptionsArray = (currentDate != null) ? [currentDate] : null;

            turnInputIntoDatePicker(currentInput, notFuture, notPast, exceptionsArray);
        }

        if (!Validation.isEmpty(parent)) {
            // stop user from manually typing date except backspace and delete
            // which will clear the whole value to ensure we either have a whole
            // date string or none

            parent.addEventListener("keydown", isDatePickerSelector, function(event) {
                if (event.keyCode == 46 | event.keyCode == 8) { // delete or backspace
                    this.val('');
                }
                else {
                    event.preventDefault();
                    event.stopPropagation();
                }

                return false
            });
            
            if (addClearOption) {

                // if user right-clicks in date input, give option to clear the date
                parent.contextMenu({
                    selector: isDatePickerSelector,
                    delay: 100,
                    autoHide: true,
                    position: function(opt, x, y) { 
                        var event = opt.$trigger[0]?.ownerDocument?.defaultView?.event || event;
                        opt.$menu.position({ my: 'center top', at: 'center top', of: event }); 
                    },
                    items: {
                        "clears": {
                            name: "Clear Date",
                            icon: "delete",
                            disabled: function(key, opt) { return Validation.isEmpty(document.querySelectorAll(opt.$trigger)); }, // if it's already empty, don't do anything
                            callback: function(itemKey, opt, rootMenu, originalEvent) { var input = document.querySelectorAll(opt.$trigger); input.val(''); input.trigger('change'); }
                        }
                    }
                });
            }
        }
    }
}

function turnInputIntoDatePicker(input, notFuture, notPast, exceptionValueArray) {
    
    var beforeShowDayCallBack = null;

    if (notFuture || notPast) {

        var today = new Date();
        today.setHours(0, 0, 0, 0);

        var tomorrow = new Date();
        tomorrow.setDate(today.getDate() + 1);
        tomorrow.setHours(0, 0, 0, 0);

        var hasExceptions = !Validation.isEmpty(exceptionValueArray);

        beforeShowDayCallBack = function(date) {

            var selectedDate = date.getTime();
            var fieldHasException = hasExceptions && Validation.arrayContainsItem(exceptionValueArray, date);

            if (notFuture && (tomorrow < selectedDate) && fieldHasException) return [false, 'redday', 'You cannot choose a future date'];
            if (notPast && (selectedDate < today) && fieldHasException) return [false, 'redday', 'You cannot choose a past date'];

            return [true, '', ''];
        };
    }

    input.datepicker({
        dateFormat: 'dd-mm-yy',
        navigationAsDateFormat: true,
        beforeShowDay: beforeShowDayCallBack
    });

    // prevent datepicker from appearing on right click
    input.addEventListener('contextmenu', function() { this.datepicker('hide'); });

    // Disable autocomplete suggestions appearing when clicking on input
    input.getAttribute('autocomplete', 'off');
}

function setDatePickerDate(input, objDate) {
    if (!Validation.isEmpty(objDate)) {
        input.val('');
    }
    else {
        input.datepicker('setDate', objDate);
    }
}

function getDatePickerDate(input, adjust4DayLightSavings) {

    var date = null;

    if (!Validation.isEmpty(input)) {
        date = input.datepicker('getDate');

        if (adjust4DayLightSavings) {
            formatDateDayLightSavingsTime(date);
        }
    }

    return date;
}

function formatDateDayLightSavingsTime(date) {
    // JSON.stringify removes hour delta for daylight savings 
    // e.g. 13/11/2023 01:00:00 goes to 13/11/2023 00:00:00
    // this adds an hour so it becomes the correct time when stringified
    if (!Validation.isEmpty(date)) {
        date.setTime(date.getTime() - date.getTimezoneOffset() * 60 * 1000)
    }
}
*/
function convertJSONDateString2Date(dateStr) {
    if (Validation.isEmpty(dateStr)) return null;
    if (dateStr instanceof Date) return dateStr;
    return new Date(parseInt(dateStr.substr(6)));
}

function convertDDMMYYYYString2Date(dateStr, adjust4DayLightSavings) {
    var date = null;

    if (!Validation.isEmpty(dateStr)) {
        if (dateStr instanceof Date) {
            date = dateStr;
        }
        else {
            var dateParts = dateStr.split('-');

            if (dateParts.length == 3) {
                date = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
            }
        }

        if (adjust4DayLightSavings && !Validation.isEmpty(date)) {
            formatDateDayLightSavingsTime(date);
        }
    }

    return date;
}

function convertDate2DDMMYYYYString(date) {
    if (Validation.isEmpty(date)) return '';

    try {
        var dd = date.getDate();
        var mm = date.getMonth() + 1;
        var yyyy = date.getFullYear();

        if (dd < 10) dd = '0' + dd;
        if (dd < 10) mm = '0' + mm;
        
        return dd + '-' + mm + '-' + yyyy;
    }
    catch (err) {
        return 'Formatting error';
    }
}
