

function handleSelectCollapse(elementSelect) {
    let optionSelected = document.querySelectorAll(elementSelect).querySelector('option:selected');
    optionSelected.text(optionSelected.getAttribute(attrTextCollapsed));
    console.log('collapsed: ', optionSelected.text());
    optionSelected.classList.remove(flagExpanded);
    optionSelected.classList.add(flagCollapsed);
}
function handleSelectExpand(elementSelect) {
    let optionSelected = document.querySelectorAll(elementSelect).querySelector('option:selected');
    optionSelected.text(optionSelected.getAttribute(attrTextExpanded));
    console.log('expanded: ', optionSelected.text());
    optionSelected.classList.remove(flagCollapsed);
    optionSelected.classList.add(flagExpanded);
}