import 'assets/javascripts/moment.min.js'
import 'assets/javascripts/fullcalendar.js'
import 'assets/javascripts/daterangepicker.js'

import 'assets/stylesheets/fullcalendar.css'
import 'assets/stylesheets/daterangepicker.css'

import moment from 'moment';

const m = moment(); 

var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').each(function(){
    $(this).daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        alwaysShowCalendars: true
    }, function(start_date, end_date, label) {
      $('.start_datetime_hidden').val(start.format('YYYY-MM-DD HH:mm'));
      $('.end_datetime_hidden').val(end.format('YYYY-MM-DD HH:mm'));
    });
  })
};
$(document).on('turbolinks:load', date_range_picker);

function eventCalendar() {
  return $('#assignment_calendar').fullCalendar({ });
};

function clearCalendar() {
  $('#assignment_calendar').fullCalendar('delete'); 
  $('#assignment_calendar').html('');
};

var initialize_calendar;
initialize_calendar = function() {
  $('#assignment_calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      minTime: "09:00:00",
      maxTime: "20:00:00",
      height: "auto",
      defaultView: 'agendaWeek',
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true, 
      events: '/assignments.json',

      select: function(start, end) {
        $.getScript('/assignments/new', function() {
          $('#assignment_date_range').val(moment(start).format("YYYY-MM-DD HH:mm") + ' - ' + moment(end).format("YYYY-MM-DD HH:mm"));
          $('.start_datetime_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_datetime_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
        });
        
        calendar.fullCalendar('unselect');
      },

      eventDrop: function(assignment, delta, revertFunc) { 
        var assignment_data = { 
          assignment: {
            id: assignment.id,
            start_datetime: assignment.start_datetime,
            end_datetime: assignment.end_datetime
          }
        };
        $.ajax({
            url: assignment.update_url, 
            data: assignment_data,
            type: 'PATCH'
        });
      },
      
      eventClick: function(assignment, jsEvent, view) {
        $.getScript(assignment.edit_url, function() {          
        });
      }
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);