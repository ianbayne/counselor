// var initialize_calendar;
// initialize_calendar = function() {
//   $('.calendar').each(function(){
//     var calendar = $(this);
//     calendar.fullCalendar({
//       header: false,
//       selectable: true,
//       selectHelper: true,
//       editable: true,
//       eventLimit: true,
//     //   events: '/appointments.json',

//       select: function(start, end) {
//         $.getScript('/appointments/new', function() {
//           $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
//           date_range_picker();
//           $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
//           $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));

//           $('.time-picker').change(e => {
//             const time = $(e.currentTarget).val();
//             const date = $('.start_hidden').val().split(' ')[0];
//             $('.start_hidden').val(date + ' ' + time);
//           });



//           // $('.add-appointment').submit(e => {
//           //   e.preventDefault();
//           //   const time = $(e.currentTarget).find('input').val();
//           //   console.log('Submit manually!', time, typeof time);
//           //   fetch('/appointments', {
//           //     headers: {
//           //       'Accept': 'application/json',
//           //       'Content-Type': 'application/json'
//           //     },
//           //     method: "POST",
//           //     body: JSON.stringify({ time: time }),
//           //     credentials: 'include'
//           //   });
//           // });
//         });

//         calendar.fullCalendar('unselect');
//       },

//       events:

//       [


//      //  {
//      //  id: 1,
//      //  title: "https://zoom.us/s/775175925",
//      //  start: new Date(),
//      // }

//                     <% @appointments.each do |appointment| %>
//                       {
//                           <!-- title  : <%= ("Booked").to_json.html_safe %>, -->
//                           start  : <%= appointment.start_time.strftime("%Y-%m-%dT%H:%M").to_json.html_safe %>,
//                           end    : <%= appointment.end_time.strftime("%Y-%m-%dT%H:%M").to_json.html_safe %>,
//                           title    :
//                          <!--  Probably don't need, since all bookings should from now on have a URL -->
//                           <% if appointment.url %>
//                             "Booked with the URL: " + <%= appointment.url.to_json.html_safe %>
//                           <% else %>
//                             <%= ("Booked").to_json.html_safe %>
//                           <% end %>,
//                           url    : <%= appointment.url.to_json.html_safe %>

//                       },
//                     <% end %>


//                   ],
//             eventClick: function(event) {
//               if (event.url) {
//                   window.open(event.url);
//                   return false;
//               }
//             }


//     //   eventDrop: function(event, delta, revertFunc) {
//     //     event_data = {
//     //       event: {
//     //         id: event.id,
//     //         start: event.start.format(),
//     //         end: event.end.format()
//     //       }
//     //     };
//     //     $.ajax({
//     //         url: event.update_url,
//     //         data: event_data,
//     //         type: 'PATCH'
//     //     });
//     //   },

//     //   eventClick: function(event, jsEvent, view) {
//     //     $.getScript(event.edit_url, function() {
//     //       $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
//     //       date_range_picker();
//     //       $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
//     //       $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
//     //     });
//     //   }

//     });
//   })
// };
// $(document).ready(function(){initialize_calendar()});
