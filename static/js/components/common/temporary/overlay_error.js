
import Events from "../../../lib/events.js";

export default class OverlayError {
    static hookup() {
        Events.initialiseEventHandler(idOverlayError + ' button.' + flagCancel, flagInitialised, (buttonCancel) => {
            buttonCancel.addEventListener('click', () => {
                let overlay = document.querySelector(idOverlayError);
                overlay.style.visibility = 'hidden';
            });
        });
    }
    static show(msgError) {
        let overlay = document.querySelector(idOverlayError);
        let labelError = overlay.querySelector(idLabelError);
        labelError.innerText = msgError;
        overlay.style.visibility = 'visible';
    }
}