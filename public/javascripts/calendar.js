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
        
        sayNames:['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort:['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
        monthNames:['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort:['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul','Ago','Sept','Oct','Nov','Dic'],

        // a future calendar might have many sources.        
        eventSources: [{
            url: '/events',
            color: 'green',
            textColor: 'black',
            ignoreTimezone: false
        }],
        
        timeFormat: 'h:mm t{ - h:mm t} ',
        dragOpacity: "0.5",
        
        //http://arshaw.com/fullcalendar/docs/event_ui/eventDrop/
        eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc){
           // updateEvent(event);
        },

        // http://arshaw.com/fullcalendar/docs/event_ui/eventResize/
        eventResize: function(event, dayDelta, minuteDelta, revertFunc){
            updateEvent(event);
        },

        // http://arshaw.com/fullcalendar/docs/mouse/eventClick/
        eventClick: function(event, jsEvent, view){
         // would like a lightbox here.
         	var descripcion = event.title
         	$("#dia").val($.fullCalendar.formatDate( event.start, 'yyyy-MM-dd' ));
         	$("#event_starts_at").val($.fullCalendar.formatDate( event.start, 'HH:mm' ));
            $("#event_ends_at").val($.fullCalendar.formatDate( event.end, 'HH:mm' ));
         	$("#event_description").val(descripcion);
         	$("#event_id").val(event.id);
        	jQuery("#nuevoevento").dialog({ width:200, height:250, modal: true });
        	return false;
        },
	
	
		dayClick: function(date, allDay, jsEvent, view){
			//captura los datos de fecha en inputs de tipo hidden
			$("#starts_at").val($.fullCalendar.formatDate( date, 'yyyy-MM-dd HH:mm:ss' ));
			$("#input_allDay").val(allDay);
			//Mostrar el formulario
			jQuery("#nuevoevento").dialog({ width:800, height:250, modal: true, show: 'slide' });
		},
		
	
	});
	
});

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

