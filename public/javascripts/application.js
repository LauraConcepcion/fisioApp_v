// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function (){  
    $('#paciente_birthdate').datepicker({ dateFormat: 'dd-mm-yy' , changeYear: true,yearRange: '1950:2010'});
    $('#clinicalhistory_assessmentdate').datepicker({ dateFormat: 'dd-mm-yy' });
    $('#clinicalhistory_startdatetto').datepicker({ dateFormat: 'dd-mm-yy' });
    $('#clinicalhistory_enddatetto').datepicker({ dateFormat: 'dd-mm-yy' });


	$("#edita_evento_form").hide();
	$('#editarEvento').dialog({
		autoOpen: false,
		width:300,	
		height:400,
		position: [30,100],
		modal: true,
	});
});


