
import Validation from "./lib/validation";

export default class TextArea {
    removeBlankTextAreaLines(textarea) {
        textarea.val(textarea.val.replace(/(?:(?:\r\n|\r|\n)\s*){2}/gm, ''));
    }

    fitTextAreasToContent(parent) {
        var textareas = parent.querySelector('textarea');

        if (!Validation.isEmpty(textareas)) {
            for (var t = 0; t < textareas.length; t++) {
                fitTextAreaToContent(document.querySelectorAll(textareas[t]));
            }
        }
    }

    fitTextAreaToContent(textarea) {
        // Trim new text
        var txtNew = textarea.val().trim();
        textarea.val(txtNew);

        var elTextarea = textarea[0];

        // Clear style height and set rows = 1
        elTextarea.style.removeProperty('height');
        textarea.attr('rows', 1);

        const paddingTop = parseCSSPropertyToFloat(textarea, 'padding-top');
        const paddingBottom= parseCSSPropertyToFloat(textarea, 'padding-bottom');
        const borderTop = parseCSSPropertyToFloat(textarea, 'border-top');
        const borderBottom = parseCSSPropertyToFloat(textarea, 'border-bottom');
        let heightDelta = paddingTop + paddingBottom + borderTop + borderBottom;
        let heightNew = elTextarea.scrollHeight + heightDelta;

        // If new height is less than 1 linem default to single line height
        const heightSingleLine = parseCSSPropertyToFloat(textarea, 'line-height') + heightDelta;
        if (heightNew < heightSingleLine) heightNew = heightSingleLine;

        elTextarea.style.height = heightNew + 'px';
    }
}

