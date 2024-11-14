

export default class ProductPermutation {
    static getProductVariationsFromIdCsv(csvVariations) {
        let productVariations = [];
        if (!csvVariations) return productVariations;
        let variationPairs = csvVariations.split(',');
        if (variationPairs.length == 0) return productVariations;
        let parts;
        variationPairs.forEach((variationPair) => {
            parts = variationPair.split(':');
            if (parts.length == 2) {
                let productVariationType = productVariationTypes[parts[0]];
                productVariationType[flagProductVariations].some((productVariation) => {
                    if (productVariation[attrIdProductVariation] == parts[1]) {
                        productVariations.push([productVariationType, productVariation]);
                        return true;
                    }
                    return false;
                });
            }
        });
        return productVariations;
    }
    static getProductVariationsPreviewFromIdCsv(csvVariations) {
        let variationPairs = ProductPermutation.getProductVariationsFromIdCsv(csvVariations);
        let preview = '';
        if (variationPairs.length == 0) return preview;
        let variationType, variation;
        variationPairs.forEach((variationPair) => {
            if (preview.length > 0) {
                preview += '\n';
            }
            variationType = variationPair[0];
            variation = variationPair[1];
            preview += variationType[flagName] + ': ' + variation[flagName];
        });
        return preview;
    }

    static getProductVariationsIdCsvFromVariationTypeList(variationTypeList) {
        let csvVariations = '';
        if (Validation.isEmpty(variationTypeList)) return csvVariations;
        variationTypeList.forEach((variationType) => {
            if (csvVariations.length > 0) {
                csvVariations += ',';
            }
            csvVariations += variationType[attrIdProductVariationType] + ':' + variationType[flagProductVariations][0][attrIdProductVariation];
        });
        return csvVariations;
    }
}