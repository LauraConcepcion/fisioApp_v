// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function (){  
    $('#paciente_birthdate').datepicker({ dateFormat: 'dd-mm-yy' , changeYear: true,yearRange: '1950:2010'});
    $('#clinicalhistory_assessmentdate').datepicker({ dateFormat: 'dd-mm-yy' });
    $('#clinicalhistory_startdatetto').datepicker({ dateFormat: 'dd-mm-yy' });
    $('#clinicalhistory_enddatetto').datepicker({ dateFormat: 'dd-mm-yy' });
    $("#provenance_id").change(function() {
	    // make a POST call and replace the content
	    var provenance = $('select#provenance_id :selected').val();
	    if(provenance == "") provenance="0";
	    jQuery.get('/pacientes/update_rate_select/' + provenance, function(data){
	        $("#rate").html(data);
	    })
	    return false;
  	});

});