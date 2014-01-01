// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require rails.validations

$(function() {
	$(':input:visible:first').focus();
});

function ajax_get(url) {
	$.ajax({
		url: url,
		type: "GET",
		processData: false,
		contentType: false,
		beforeSend: function(xhr, settings) {
	    	xhr.setRequestHeader('accept', '*/*;q=0.5, ' + settings.accepts.script);
	    }
	});
}

function hideModal(modal) {
	modal.modal('hide');
}