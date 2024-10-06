// Utility functions
/*
function $(selector) {
    return document.querySelector(selector);
}

function $$(selector) {
    return document.querySelectorAll(selector);
}
*/
export default class Utils {
    static getListFromDict(dict) {
        let list = [];
        for (let key in dict) {
            list.push(dict[key]);
        }
        return list;
    }
}