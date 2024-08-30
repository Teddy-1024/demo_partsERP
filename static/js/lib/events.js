
function initialiseEventHandler(selectorElement, classInitialised, eventHandler) {
    document.querySelectorAll(selectorElement).forEach(function(element) {
        if (!element.classList.contains(classInitialised)) {
            element.classList.add(classInitialised);
            eventHandler(element);
        }
    });
}