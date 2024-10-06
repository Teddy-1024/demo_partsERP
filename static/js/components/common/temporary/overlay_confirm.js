
import Events from "../../../lib/events.js";

export default class OverlayConfirm {
    static hookup(callbackSuccess) {
        Events.initialiseEventHandler(idOverlayConfirm + ' button.' + flagCancel, flagInitialised, (buttonCancel) => {
            buttonCancel.addEventListener('click', () => {
                let overlay = document.querySelector(idOverlayConfirm);
                overlay.style.visibility = 'hidden';
            });
        });
        Events.initialiseEventHandler(idOverlayConfirm + ' button.' + flagSubmit, flagInitialised, (buttonConfirm) => {
            buttonConfirm.addEventListener('click', () => {
                let overlay = document.querySelector(idOverlayConfirm);
                let textarea = overlay.querySelector('textarea');
                overlay.style.visibility = 'hidden';
                callbackSuccess(textarea.value);
            });
        });
    }
    static show() {
        let overlay = document.querySelector(idOverlayConfirm);
        overlay.classList.remove(flagCollapsed);
        overlay.style.visibility = 'visible';
    }
}