

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
                let productVariation = productVariations[parts[1]];
                if (productVariationType && productVariation) {
                    productVariations.push([productVariationType, productVariation]);
                }
            }
        });
        return productVariations;
    }
    static getProductVariationsPreviewFromIdCsv(csvVariations) {
        let variations = ProductPermutation.getProductVariationsFromIdCsv(csvVariations);
        let preview = '';
        if (variations.length == 0) return preview;
        variations.forEach((variation) => {
            if (preview.length > 0) {
                preview += '\n';
            }
            preview += variation[0] + ': ' + variation[1] + ', ';
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