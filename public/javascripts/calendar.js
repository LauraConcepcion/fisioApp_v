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
          	$('#tab').tabs( "load" , 0 )
   			dia = $.fullCalendar.formatDate(event, 'ddd, yyyy-MM-dd' );
         	$("#dia").val(dia);
         	$("#starts_at").val($.fullCalendar.formatDate(event, 'HH:mm' ));
            $("#ends_at").val($.fullCalendar.formatDate(event, 'HH:mm' ));
			//Mostrar el formulario
			jQuery("#actualizaevento").dialog({ 
				width:200, 
				height:300, 
				modal: true, 
				show: 'slide',
				close: function(event, ui){
            		$(this).dialog("destroy");
            },
        	});   
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
			jQuery("#nuevoevento").dialog({ 
				width:850, 
				height:200, 
				modal: true, 
				show: 'slide',
				close: function(event, ui){
            		$(this).dialog("destroy");
            },
        	});        	
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

