$(document).ready(function() {
  var gite = window.location.pathname.split("/").pop();
  var nb_event_created = 0;
  $('#calendar').fullCalendar({
      defaultView: 'month',
      header: {
        left:   'title',
        center: '',
        right:  'today prev,next'
      },
      height: 600,
			selectable: true,
			selectHelper: true,
      longPressDelay: 100,
      allDayDefault: true,
			select: function(start, end) {
        if (confirm("Creating event with Start at " + start.format() + " and end at " + end.format() + ". is this okay?")) {
        $.ajax({
          method: "POST",
          data: {event: {start_at: start._d, end_at: end._d, gite: gite}},
          url: "/events",
          success: function(data){
            nb_event_created++;
            var ev = { id: data.id, start: start, end: end, gite: gite, color: 'red' }
            //console.log(nb_event_created);
            if(nb_event_created > 1){
              $('#calendar').fullCalendar('removeEvents');
              $('#calendar').fullCalendar('addEventSource', "/events?gite=" + gite);
              $('#calendar').fullCalendar('refetchResources' );
                //window.location.reload();
            }else{
              $('#calendar').fullCalendar('renderEvent', ev, true);
            }
            //$('#calendar').fullCalendar('renderEvent', ev, true);
          },
          error: function(error){
            alert("Error !! Was already booked on this period ??");
          }
        });
        }
				$('#calendar').fullCalendar('unselect');
			},
			editable: true,
			eventLimit: true,
      eventSources: [
        {
            url: "/events?gite=" + gite
        }
      ],
      eventClick: function(calEvent, jsEvent, view) {
        alert('Event: ' + calEvent.title);
      },
      eventResize: function(event, delta, revertFunc) {
        if (confirm("Start is now " + event.start.format() + " and end is now " + event.end.format() + ". is this okay?")) {
          var censor = function censor(censor) {
            var i = 0;
            return function(key, value) {
              if(i !== 0 && typeof(censor) === 'object' && typeof(value) == 'object' && censor == value)
              return '[Circular]';
              if(i >= 29) // seems to be a harded maximum of 30 serialized objects?
              return '[Unknown]';
              ++i; // so we know we aren't using the original object anymore
              return value;
            }
          }
          var ev = JSON.stringify(event, censor(event));
          $.ajax({
            method: "PATCH",
            data: {event: {start_at: event.start._d, end_at: event.end._d, gite: gite, event: ev}},
            url: "/events/update_event",
            success: function(data){
              //var ev = {  }
              $('#calendar').fullCalendar('renderEvent', event, true);
            },
            error: function(error){
              alert("Error !! Was already booked on this period ??");
              revertFunc();
            }
          });
        }else{
          revertFunc();
        }

    },
    eventDrop: function(event, delta, revertFunc) {
      if (confirm("Start is now " + event.start.format() + " and end is now " + event.end.format() + ". is this okay?")) {
        var censor = function censor(censor) {
          var i = 0;
          return function(key, value) {
            if(i !== 0 && typeof(censor) === 'object' && typeof(value) == 'object' && censor == value)
            return '[Circular]';
            if(i >= 29) // seems to be a harded maximum of 30 serialized objects?
            return '[Unknown]';
            ++i; // so we know we aren't using the original object anymore
            return value;
          }
        }

        /*if(event.gite){
          var ev = event;
        }else{
          var ev = JSON.stringify(event, censor(event));
        }*/
        var ev = JSON.stringify(event, censor(event));
        $.ajax({
          method: "PATCH",
          data: {event: {start_at: event.start._d, end_at: event.end._d, gite: gite, event: ev}},
          url: "/events/update_event",
          success: function(data){
            $('#calendar').fullCalendar('renderEvent', event, true);
          },
          error: function(error){
            alert("Error !! Could not be updated ! Was already booked on this period ??");
            revertFunc();
          }
        });
      }else{
        revertFunc();
      }

    },
    eventClick: function(event){
      if (confirm("delete event ?")){
        var censor = function censor(censor) {
          var i = 0;
          return function(key, value) {
            if(i !== 0 && typeof(censor) === 'object' && typeof(value) == 'object' && censor == value)
            return '[Circular]';
            if(i >= 29) // seems to be a harded maximum of 30 serialized objects?
            return '[Unknown]';
            ++i; // so we know we aren't using the original object anymore
            return value;
          }
        }
        var ev = JSON.stringify(event, censor(event));
        $.ajax({
          method: "DELETE",
          data: {event: {gite: gite, event: ev}},
          url: "/events/delete_event",
          success: function(data){
            $('#calendar').fullCalendar('renderEvent', event, true);
          },
          error: function(error){
            alert("Error !! Could not be deleted !");
            revertFunc();
          }
        });
        $('#calendar').fullCalendar('removeEvents', event._id);
      }else{

      }

    }
  });


});
