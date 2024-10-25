
import Common from "../../../lib/common.js";
import Validation from "../../../lib/validation.js";

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
        textarea.getAttribute('rows', 1);

        const paddingTop = Common.parseFloatWithDefault(textarea.style.paddingTop);
        const paddingBottom = Common.parseFloatWithDefault(textarea.style.paddingBottom);
        const borderTop = Common.parseFloatWithDefault(textarea.style.borderTop);
        const borderBottom = Common.parseFloatWithDefault(textarea.style.borderBottom);
        let heightDelta = paddingTop + paddingBottom + borderTop + borderBottom;
        let heightNew = elTextarea.scrollHeight + heightDelta;

        // If new height is less than 1 linem default to single line height
        const heightSingleLine = Common.parseFloatWithDefault(textarea.style.heightSingleLine) + heightDelta;
        if (heightNew < heightSingleLine) heightNew = heightSingleLine;

        elTextarea.style.height = heightNew + 'px';
    }
}

