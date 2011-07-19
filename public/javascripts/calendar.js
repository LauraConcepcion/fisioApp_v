$(document).ready(function() {

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
						
	
	$('#calendar').fullCalendar({
		editable: true,        
		header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        defaultView: 'agendaWeek',
        height: 500,
        slotMinutes: 30,
        minTime:9,
        maxTime:21,
        defaultEventMinutes:60,
        firstDay:1,
        theme:true,        
        
        loading: function(bool){
            if (bool) 
                $('#loading').show();
            else 
                $('#loading').hide();
        },
        
        // a future calendar might have many sources.        
        eventSources: [{
            url: '/events',
            color: 'yellow',
            textColor: 'black',
            ignoreTimezone: false,
            error: function() {
                alert('there was an error while fetching events!');
            },
        }],
        sayNames:['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort:['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
        monthNames:['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort:['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul','Ago','Sept','Oct','Nov','Dic'],
        
        timeFormat: 'h:mm t{ - h:mm t} ',
        dragOpacity: "0.5",
        
        //http://arshaw.com/fullcalendar/docs/event_ui/eventDrop/
        eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc){
            updateEvent(event);
        },

        // http://arshaw.com/fullcalendar/docs/event_ui/eventResize/
        eventResize: function(event, dayDelta, minuteDelta, revertFunc){
            updateEvent(event);
        },

        // http://arshaw.com/fullcalendar/docs/mouse/eventClick/
        eventClick: function(event, jsEvent, view){
          // would like a lightbox here.
          	dia = $.fullCalendar.formatDate(event.start, 'ddd ,yyyy-MM-dd' );
         	$("#dia").val(dia);
         	$("#event_starts_at").val($.fullCalendar.formatDate(event.start, 'HH:mm' ));
            $("#event_ends_at").val($.fullCalendar.formatDate(date, 'HH:mm' ));
            $("#start").val(event.start);
            $("#event_description").val(event.description);
            $("#end").val($.fullCalendar.formatDate(date, 'HH:mm' ));
            $("#Centro").val(event.center_id);
            $("#specialist_specialist_id").val(event.specialist_id);
            $("#event_attended").val(event.attended);
            $("#paciente_name").val(event.paciente_id);


			//Mostrar el formulario
   
        	return false;
        },
        
        dayClick: function(date, allDay, jsEvent, view){
			//captura los datos de fecha en inputs de tipo hidden
			
         	dia = $.fullCalendar.formatDate(date, 'ddd ,yyyy-MM-dd' );
         	$("#dia").val(dia);
         	$("#event_starts_at").val($.fullCalendar.formatDate(date, 'HH:mm' ));
            $("#event_ends_at").val($.fullCalendar.formatDate(date, 'HH:mm' ));
            $("#start").val(date);
            $("#end").val($.fullCalendar.formatDate(date, 'HH:mm' ));

			//Mostrar el formulario
		},
		//Mostramos la información que queramos del evento en el calendario.
		eventRender: function(event, element) { 
            element.find('.fc-event-title').append("<br/><b>" + event.description); 
       },

	});
});


function showEventDetails(event){
    $('#dia').html($.fullCalendar.formatDate( event.start, 'yyyy-MM-dd' ));
    jQuery("#actualizaevento").dialog({ 
				width:300, 
				height:200, 
				modal: true, 
				show: 'slide',
				close: function(event, ui){
            		$(this).dialog("destroy");
            },
        	});   
    
}


function updateEvent(the_event) {
    $.update(
      "/events/" + the_event.id,
      { event: { title: the_event.title,
                 starts_at: "" + the_event.start,
                 ends_at: "" + the_event.end,
                 description: the_event.description
               }
      },
      function (reponse) { alert('successfully updated task.'); }
    );
};

