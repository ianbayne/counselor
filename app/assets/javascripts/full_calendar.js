var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: false,
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
    //   events: '/appointments.json',

      select: function(start, end) {
        $.getScript('/appointments/new', function() {
          $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));

          $('.time-picker').change(e => {
            const time = $(e.currentTarget).val();
            const date = $('.start_hidden').val().split(' ')[0];
            $('.start_hidden').val(date + ' ' + time);
          });



          // $('.add-appointment').submit(e => {
          //   e.preventDefault();
          //   const time = $(e.currentTarget).find('input').val();
          //   console.log('Submit manually!', time, typeof time);
          //   fetch('/appointments', {
          //     headers: {
          //       'Accept': 'application/json',
          //       'Content-Type': 'application/json'
          //     },
          //     method: "POST",
          //     body: JSON.stringify({ time: time }),
          //     credentials: 'include'
          //   });
          // });
        });

        calendar.fullCalendar('unselect');
      },

    //   eventDrop: function(event, delta, revertFunc) {
    //     event_data = {
    //       event: {
    //         id: event.id,
    //         start: event.start.format(),
    //         end: event.end.format()
    //       }
    //     };
    //     $.ajax({
    //         url: event.update_url,
    //         data: event_data,
    //         type: 'PATCH'
    //     });
    //   },

    //   eventClick: function(event, jsEvent, view) {
    //     $.getScript(event.edit_url, function() {
    //       $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
    //       date_range_picker();
    //       $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
    //       $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
    //     });
    //   }

    });
  })
};
$(document).ready(function(){initialize_calendar()});
