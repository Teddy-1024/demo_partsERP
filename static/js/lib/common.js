
function getElementCurrentValue(element) {
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
        else if (element.tagName === 'INPUT' || element.tagName === 'textarea' || element.tagName === 'select') {
            returnVal = element.value;
        }
        else {
            returnVal = element.textContent;
        }
    }

    if (isEmpty(returnVal)) returnVal = '';

    return returnVal;
}

function parseCSSPropertyToFloat(element, propertyName) {
    var propertyText = element.css(propertyName);

    if (!isEmpty(propertyText)) {

        propertyText = propertyText.replace('px', '');

        if (!isValidNumber(propertyText, true)) return parseFloat(propertyText);
    }

    return 0.00;
}

function scrollToElement(parent, element) {
    // REQUIRED: parent has scroll-bar
    parent.scrollTop(parent.scrollTop() + (element.offset().top - parent.offset().top));
}

function isElementInContainer(container, element) {

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

function getRowFromElement(element) {
    return document.querySelectorAll(element).closest('tr');
}

function getCellFromElement(element) {
    return document.querySelectorAll(element).closest('td');
}

function alertError(errorType, errorText) {
    alert(errorType + '\n' + errorText);
}

function setPageToLoading(isLoading) {

    if (isLoading) {
        document.querySelectorAll(document.body).classList.add(_dataLoadingFlag);
    }
    else {
        document.querySelectorAll(document.body).classList.remove(_dataLoadingFlag);
    }
}

function setBackgroundToLoading(elId, isLoading) {

    if (isEmpty(el)) {

        var elObj = document.querySelectorAll(elId);

        if (isLoading) {

            setTimeout(function() {
                elObj.innerHTML = "";
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
    return !document.querySelectorAll("body").classList.contains(_dataLoadingFlag);
}

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

    var loadingImg = document.querySelectorAll(idImageLoading);
    var overlay = document.querySelectorAll(loadingImg.closest("div.overlay"));

    if (_overlayLoadingCount == 0) {

        // Prevent short glimpse of prev. content before switch to new content
        // caused by data load but not fully rendered
        setTimeout(function() {
            overlay.fadeOut();
        }, 100);
    }
    else if (show && _overlayLoadingCount == 1) {
        // only show once
        loadingImg.innerHTML = message;
        overlay.style.display = "";
    }
}
