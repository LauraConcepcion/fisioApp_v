// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function (){  
    $('#paciente_birthdate').datepicker({ changeYear: true ,yearRange: '1950:2010'});
    $('#clinicalhistory_assessmentdate').datepicker();
    $('#clinicalhistory_startdatetto').datepicker({ altFormat: 'yy-mm-dd' });
    $('#clinicalhistory_enddatetto').datepicker({ altFormat: 'yy-mm-dd' });
});
