
export default class Validation {
    /*
    isNullOrWhitespace(v) {
        let txt = JSON.stringify(v).replace('/\s\g', '');
        return (txt == '' || 'null');
    }
    */

    static isEmpty(object) {

        let isEmpty = true;

        if (object !== null && object !== "null" && object !== undefined && object !== "undefined") {

            if (object.length == undefined) {
                isEmpty = false; // object exists but isn't a collection
            }
            else if (typeof object === "function") {
                isEmpty = false; // object is reference
            }
            else { // string or collection

                let isString = (typeof object == "string");

                if (isString) object = object.trim();

                if (object.length > 0) {

                    if (isString) {
                        isEmpty = false; // String greater than length 0
                    }
                    else {

                        if (typeof object[0] != "string") {
                            isEmpty = false;
                        }
                        else {
                            for(let i = 0; i < object.length; i++) {
                                if (object[i] != "") {
                                    isEmpty = false;
                                    break
                                }
                            }
                        }
                    }
                }
            }
        }

        return isEmpty;
    }

    static isValidNumber(value, positiveOnly) {
        return !Validation.isEmpty(value) && !isNaN(value) && (!positiveOnly || parseFloat(value) > 0);
    }

    static getDataContentType(params) {

        var data = null;
        var contentType = '';

        if (!Validation.isEmpty(params)) {

            if (typeof params === "string") {
                data = params;
                contentType = "application/x-www-form-urlencoded; charset=UTF-8";
            }
            else {
                data = JSON.stringify(params);
                contentType = "application/json; charset=UTF-8";
            }
        }

        return { Data: data, ContentType: contentType };
    }

    static arrayContainsItem(array, itemValue) {

        var hasItem = false;

        if (!Validation.isEmpty(array) && !Validation.isEmpty(itemValue)) {

            var isJQueryElementArray = array[0] instanceof jQuery;

            if (isJQueryElementArray) {

                for (let i = 0; i < array.length; i++) {

                    if (document.querySelectorAll(array[i]).is(itemValue)) {
                        hasItem = true;
                        break;
                    }
                }
            }
            else {

                var isDate = array[0] instanceof Date;

                if (isDate) {
                    
                    for (let i = 0; i < array.length; i++) {

                        if (array[i].getTime() === itemValue.getTime()) {
                            hasItem = true;
                            break;
                        }
                    }
                }
                else {

                    for (let i = 0; i < array.length; i++) {

                        if (array[i] == itemValue) {
                            hasItem = true;
                            break;
                        }
                    }
                }
            }
        }

        return hasItem;
    }

    static dictHasKey(d, k) {
        return (k in d);
    }
    static areEqualDicts(dict1, dict2) {
        const keys1 = Object.keys(dict1);
        const keys2 = Object.keys(dict2);
        
        if (keys1.length !== keys2.length) {
        return false;
        }
        
        for (let key of keys1) {
        if (dict1[key] !== dict2[key]) {
            return false;
        }
        }
        
        return true;
    }

    static imageExists(url, callback) {

        var img = new Image();

        img.onload = function() { callback(true); };
        img.onerror = function() { callback(false); };
        img.src = url;
    }
}
