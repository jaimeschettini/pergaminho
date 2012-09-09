function executeOnChange(selectId, identifier) {
	var select = $(selectId);
	select.unbind("change");
	select.change(function() {
		var selected = select.find("option:selected");
		if(selected.attr("value") == identifier) {
			ajax_get(selected.attr("data-action-url"));
		}	
	});
}

$(function() {
	executeOnChange("#document_company_id", "new_company_path");
	// executeOnChange("#document_issue_id", "new_issue_path");
	// executeOnChange("#document_department_id", "new_department_path");
});