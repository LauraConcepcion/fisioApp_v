// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function (){  
    $('#paciente_birthdate').datepicker({ dateFormat: 'yy-mm-dd' , changeYear: true,yearRange: '1950:2010'});
    $('#clinicalhistory_assessmentdate').datepicker({ dateFormat: 'dd-mm-yy' });
    $('#clinicalhistory_startdatetto').datepicker({ dateFormat: 'dd-mm-yy' });
    $('#clinicalhistory_enddatetto').datepicker({ dateFormat: 'dd-mm-yy' });  
    $('#invoicehead_created_at').datepicker({ dateFormat: 'dd-mm-yy' });  
    
    $("#clinicalhistory_provenance_id").change(function() {
    	var provenance = $('#clinicalhistory_provenance_id');
        $.getJSON('/clinicalhistories/update_rate/' + provenance.val() || "0", function(rates) {
       		var options = '';
           	for(var i = 0; i < rates.length; i++)
            	options += '<option value="' + rates[i][1] +'">' +  rates[i][0]+ '</option>';
           	$("select#clinicalhistory_rate_id").html(options);
           	});
           	return false;
       });   
    $("#clinicalhistory_specialisttype_id").change(function() {
    	var provenance = $('#clinicalhistory_specialisttype_id');
        $.getJSON('/clinicalhistories/update_specialist/' + provenance.val() || "0", function(specialists) {
       		var options = '';
           	for(var i = 0; i < specialists.length; i++)
            	options += '<option value="' + specialists[i][1] +'">' +  specialists[i][0]+ '</option>';
           	$("select#clinicalhistory_specialist_id").html(options);
           	});
           	return false;
       });  
       

});
