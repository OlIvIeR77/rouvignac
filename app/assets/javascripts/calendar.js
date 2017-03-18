$(document).ready(function() {

  var gite = window.location.pathname.split("/").pop();
  var nb_event_created = 0;
  var country = window.location.pathname.split("/")[1];
  var ac = ["fr", "en", "de", "es", "nl"];
  if(ac.includes(country)){
    //console.log(country);
  }else{
    country = "fr";
  }
  //console.log(country);

  $('#calendar').fullCalendar({
      defaultView: 'month',
      header: {
        left:   'title',
        center: '',
        right:  'today prev,next'
      },
      firstDay: 0,
      lang: country,
      height: 600,
			selectable: true,
			selectHelper: true,
      longPressDelay: 100,
      allDayDefault: true,
			select: function(start, end) {
        if (confirm("Creating event with Start at " + start.format('LL') + " and end at " + end.format('LL') + ". is this okay?")) {
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
              //$('#calendar').fullCalendar('renderEvent', ev, true);

              $('#calendar').fullCalendar('removeEvents');
              $('#calendar').fullCalendar('addEventSource', "/events?gite=" + gite);
              $('#calendar').fullCalendar('refetchResources' );
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
			editable: false,
			eventLimit: true,
      eventSources: [
        {
            url: "/events?gite=" + gite
        }
      ],
      eventResize: function(event, delta, revertFunc) {
        if (confirm("Start is now " + event.start.format('LL') + " and end is now " + event.end.format('LL') + ". is this okay?")) {
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
              //$('#calendar').fullCalendar('renderEvent', event, true);
              $('#calendar').fullCalendar('removeEvents');
              $('#calendar').fullCalendar('addEventSource', "/events?gite=" + gite);
              $('#calendar').fullCalendar('refetchResources' );
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
      if (confirm("Start is now " + event.start.format('LL') + " and end is now " + event.end.format('LL') + ". is this okay?")) {
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
            //$('#calendar').fullCalendar('renderEvent', event, true);
            $('#calendar').fullCalendar('removeEvents');
            $('#calendar').fullCalendar('addEventSource', "/events?gite=" + gite);
            $('#calendar').fullCalendar('refetchResources' );
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
      if(event.editable == true){
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
            //$('#calendar').fullCalendar('renderEvent', event, true);
            $('#calendar').fullCalendar('removeEvents');
            $('#calendar').fullCalendar('addEventSource', "/events?gite=" + gite);
            $('#calendar').fullCalendar('refetchResources' );
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

    }
  });

  $('#public_calendar').fullCalendar({
      defaultView: 'month',
      header: {
        left:   'title',
        center: '',
        right:  'today prev,next'
      },
      firstDay: 0,
      height: 400,
      allDayDefault: true,
			eventLimit: true,
      lang: country,
      eventSources: [
        {
            url: "/events?gite=" + gite
        }
      ]
  });

  $('#fullcalendar').fullCalendar({
      eventOrder: 'title',
      defaultView: 'month',
      header: {
        left:   'title',
        center: '',
        right:  'today prev,next'
      },
      firstDay: 0,
      allDayDefault: true,
			eventLimit: true,
      lang: country,
      eventLimit: 11,
      eventSources: [
        {
            url: "/all_events"
        }
      ],
      eventClick: function(event){
        var wd = "";
        if(event.color == "#e01312"){
          wd = " réservé ";
        }else{
          wd = " disponible ";
        }
        $(event.id).tooltipster({
          contentAsHTML: true,
          content: "<div>Le gite " + event.title + " est" + wd + "entre le " + event.start.format('LL') + " et le " + event.end.format('LL') + ".</div>"
        });
        //alert("Le gite " + event.title + " est" + wd + "entre le " + event.start.format('LL') + " et le " + event.end.format('LL') + "." );
      },
      height: 'auto',
      eventRender: function(event, element) {
        var wd = "";
        if(event.color == "#e01312"){
          wd = " réservé ";
        }else{
          wd = " disponible ";
        }
        element.tooltipster({
          contentAsHTML: true,
          content: "<div>Le gite " + event.title + " est" + wd + "entre le " + event.start.format('LL') + " et le " + event.end.format('LL') + ".</div>"
        });
      }
  });

});
