
import Validation from "./validation";

export default class LocalStorage {
/*
function getPageLocalStorage(pageHash) {

    let ls;
    try {
        ls = JSON.parse(localStorage.getItem(pageHash));
    } catch {

    }

    if (Validation.isEmpty(ls)) return {}

    return ls;
}
function getPageLocalStorageCurrent() {

    return JSON.parse(localStorage.getItem(hashPageCurrent));
}

function setPageLocalStorage(pageHash, newLS) {

    localStorage.setItem(pageHash, JSON.stringify(newLS));
}

function clearPageLocalStorage(pageHash) {
    localStorage.removeItem(pageHash);
}

function setupPageLocalStorage(pageHash) {

    let ls = getPageLocalStorage(pageHash);

    if (Validation.isEmpty(ls)) ls = {};

    setPageLocalStorage(pageHash, ls);
}
*/

    static getLocalStorage(key) {
        return JSON.parse(localStorage.getItem(key));
    }

    static setLocalStorage(key, newLS) {
        localStorage.setItem(key, JSON.stringify(newLS));
    }

/*
function setupPageLocalStorageNext(pageHashNext) {
    let lsOld = getPageLocalStorage(hashPageCurrent);
    hashPageCurrent = pageHashNext;
    clearPageLocalStorage(hashPageCurrent);
    setupPageLocalStorage(hashPageCurrent);
    let lsNew = getPageLocalStorage(hashPageCurrent);
    lsNew[keyBasket] = (keyBasket in lsOld) ? lsOld[keyBasket] : {'items': []};
    setPageLocalStorage(hashPageCurrent, lsNew);
}
*/
}