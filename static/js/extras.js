
/* Page elements */
function displayOverlay(message, show, force) {

    if (show) {
        _overlayLoadingCount += 1;
    }
    else if (force) {
        _overlayLoadingCount = 0;
    }
    else {
        _overlayLoadingCount -= 1;
        if (_overlayLoadingCount < 0) _overlayLoadingCount = 0;
    }

    var loadingImg = $(idImageLoading);
    var overlay = $(loadingImg.closest("div.overlay"));

    if (_overlayLoadingCount == 0) {

        // Prevent short glimpse of prev. content before switch to new content
        // caused by data load but not fully rendered
        setTimeout(function() {
            overlay.fadeOut();
        }, 100);
    }
    else if (show && _overlayLoadingCount == 1) {
        // only show once
        loadingImg.html(message);
        overlay.show();
    }
}

function setBackgroundToLoading(elId, isLoading) {

    if (isEmpty(el)) {

        var elObj = $(elId);

        if (isLoading) {

            setTimeout(function() {
                elObj.html("");
                elObj.css({
                    "background-image": "url(" + urlImgLoading + ")",
                    "background-position": "center",
                    "background-repeat": "no-repeat"
                });
            }, 0);
        }
        else {
            elObj.css("background-image", "");
        }
    }
}

function allowClick() {
    return !$("body").hasClass(_dataLoadingFlag);
}

function imageExists(url, callback) {

    var img = new Image();

    img.onload = function() { callback(true); };
    img.onerror = function() { callback(false); };
    img.src = url;
}

function validateImageUrl(id, img) {
    imageExists(img, function(exists) {
        if (exists) {
            $("#" + id).css({ "background-image": "url(" + url + ")", "background-size": "35px 35px"})
        }
    })
}




// Date picker inputs
/*
function hookupInputDatePickers(dateInputs, notFuture, notPast, parent, addClearOption) {

    if (!isEmpty(dateInputs)) {

        let currentInput, currentDateString, currentDate, exceptionsArray;

        for (let i = 0; i < dateInputs.length; i++) {

            currentInput = $(dateInputs[i]);
            currentDateString = currentInput.val();
            currentDate = (!isEmpty(currentDateString)) ? convertDDMMYYYYString2Date(currentDateString, false) : null;
            exceptionsArray = (currentDate != null) ? [currentDate] : null;

            turnInputIntoDatePicker(currentInput, notFuture, notPast, exceptionsArray);
        }

        if (!isEmpty(parent)) {
            // stop user from manually typing date except backspace and delete
            // which will clear the whole value to ensure we either have a whole
            // date string or none

            parent.on("keydown", isDatePickerSelector, function(event) {
                if (event.keyCode == 46 | event.keyCode == 8) { // delete or backspace
                    $(this).val('');
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
                            disabled: function(key, opt) { return isEmpty($(opt.$trigger)); }, // if it's already empty, don't do anything
                            callback: function(itemKey, opt, rootMenu, originalEvent) { var input = $(opt.$trigger); input.val(''); input.trigger('change'); }
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

        var hasExceptions = !isEmpty(exceptionValueArray);

        beforeShowDayCallBack = function(date) {

            var selectedDate = date.getTime();
            var fieldHasException = hasExceptions && arrayContainsItem(exceptionValueArray, date);

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
    input.on('contextmenu', function() { $(this).datepicker('hide'); });

    // Disable autocomplete suggestions appearing when clicking on input
    input.attr('autocomplete', 'off');
}

function setDatePickerDate(input, objDate) {
    if (!isEmpty(objDate)) {
        input.val('');
    }
    else {
        input.datepicker('setDate', objDate);
    }
}

function getDatePickerDate(input, adjust4DayLightSavings) {

    var date = null;

    if (!isEmpty(input)) {
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
    if (!isEmpty(date)) {
        date.setTime(date.getTime() - date.getTimezoneOffset() * 60 * 1000)
    }
}
*/
function convertJSONDateString2Date(dateStr) {
    if (isEmpty(dateStr)) return null;
    if (dateStr instanceof Date) return dateStr;
    return new Date(parseInt(dateStr.substr(6)));
}

function convertDDMMYYYYString2Date(dateStr, adjust4DayLightSavings) {
    var date = null;

    if (!isEmpty(dateStr)) {
        if (dateStr instanceof Date) {
            date = dateStr;
        }
        else {
            var dateParts = dateStr.split('-');

            if (dateParts.length == 3) {
                date = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
            }
        }

        if (adjust4DayLightSavings && !isEmpty(date)) {
            formatDateDayLightSavingsTime(date);
        }
    }

    return date;
}

function convertDate2DDMMYYYYString(date) {
    if (isEmpty(date)) return '';

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


// Data tables
function getDataTableCellByNode(table, elRow, indexColumn) {
    // normal jQuery selector won't pick up hidden columns
    return $(table.DataTable().cells(elRow, indexColumn, null).nodes());
}

function outputTableElementDateInput(table, elRow, indexColumn, value) {

    let currentCell = getDataTableCellByNode(table, elRow, indexColumn);

    let dateTxt = '';

    if (!isEmpty(value)) {
        if (typeof value === 'string') value = convertJSONDateString2Date(value);
    }
}
