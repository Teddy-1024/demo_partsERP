

// Data tables
function getDataTableCellByNode(table, elRow, indexColumn) {
    // normal jQuery selector won't pick up hidden columns
    return document.querySelectorAll(table.DataTable().cells(elRow, indexColumn, null).nodes());
}

function outputTableElementDateInput(table, elRow, indexColumn, value) {

    let currentCell = getDataTableCellByNode(table, elRow, indexColumn);

    let dateTxt = '';

    if (!isEmpty(value)) {
        if (typeof value === 'string') value = convertJSONDateString2Date(value);
    }
}
