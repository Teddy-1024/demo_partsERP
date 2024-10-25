

export default class BusinessObjects {
    static getOptionJsonFromObjectJsonAndKeys(objectJson, keyText, keyValue, valueSelected = null) {
        return {
            text: objectJson[keyText],
            value: objectJson[keyValue],
            selected: (objectJson[keyValue] == valueSelected),
        };
    }
    static getOptionJsonFromObjectJson(objectJson, valueSelected = null) {
        let keyText = objectJson[flagNameAttrOptionText];
        let keyValue = objectJson[flagNameAttrOptionValue];
        console.log({objectJson, keyText, keyValue});
        return BusinessObjects.getOptionJsonFromObjectJsonAndKeys(objectJson, keyText, keyValue, valueSelected);
    }
    /*
    static getOptionJsonFromProductPermutation(permutation) {
        return {
            text: permutation
        };
    }
    */
    static getObjectText(objectJson) {
        return objectJson[objectJson[flagNameAttrOptionText]];
    }
}