
import Validation from "./validation.js";

export default class Common {
    static parseFloatWithDefault(value, defaultValue = 0.00) {
        if (!Validation.isEmpty(value) && Validation.isValidNumber(value, true)) {
            return parseFloat(value);
        }
        return defaultValue;
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