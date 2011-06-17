// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function () {  
  $('#pacientes th a').live('click', function () {  
    $.getScript(this.href);  
    return false;  
  });  
})  
    

$(function (){  
    $('#paciente_birthdate').datepicker();
    $('#clinicalhistory_assessmentdate').datepicker();
    $('#clinicalhistory_startdatetto').datepicker();
    $('#clinicalhistory_enddatetto').datepicker();
});
