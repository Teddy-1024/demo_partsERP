
import Validation from "./validation.js";

export default class Common {
    static parseCSSPropertyToFloat(element, propertyName) {
        var propertyText = element.css(propertyName);

        if (!Validation.isEmpty(propertyText)) {

            propertyText = propertyText.replace('px', '');

            if (!Validation.isValidNumber(propertyText, true)) return parseFloat(propertyText);
        }

        return 0.00;
    }

    static setPageToLoading(isLoading) {

        if (isLoading) {
            document.querySelectorAll(document.body).classList.add(_dataLoadingFlag);
        }
        else {
            document.querySelectorAll(document.body).classList.remove(_dataLoadingFlag);
        }
    }

    static setBackgroundToLoading(elId, isLoading) {

        if (Validation.isEmpty(el)) {

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

    static allowClick() {
        return !document.querySelectorAll("body").classList.contains(_dataLoadingFlag);
    }

    static displayOverlay(message, show, force) {

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
}