//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require_tree .

$('#calendar').fullCalendar({
  defaultView: "listWeek",
  weekends: false,
  events: [
        {
            title  : 'badaboom!',
            start  : '2017-10-26T10:00',
            end    : '2017-10-26T11:00'
        },
        {
            title  : 'booyeah',
            start  : '2017-10-27T15:00',
            end    : '2017-10-27T16:00'
        },
        {
            title  : 'event3',
            start  : '2017-10-23T12:30:00',
            allDay : false // will make the time show
        }
    ],
  dayClick: function() {
        alert('a day has been clicked!');
    },
});
