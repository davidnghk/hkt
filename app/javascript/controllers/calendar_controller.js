import { Controller} from "stimulus"
import { Calendar } from '@fullcalendar/core'
import listPlugin from '@fullcalendar/list';
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import interactionPlugin from '@fullcalendar/interaction'
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = ["calendar", "modal", "start_time", "end_time"]

  connect() {
    let _this = this
    let calendar = new Calendar(this.calendarTarget, {
      initialView: 'timeGridWeek',
      StartTime: '08:00:00',
      events: '/tasks.json',
      editable: true,
      navLinks: true,
      headerToolbar: { center: 'dayGridMonth,timeGridWeek,timeGridDay' },
      plugins: [dayGridPlugin,timeGridPlugin,interactionPlugin,listPlugin],
      navLinkDayClick: function(date, jsEvent) {
        _this.modalTarget.style.display = "block"
        _this.start_timeTarget.value = date
        _this.end_timeTarget.value = date
      },
      eventClick: function (info) {
        info.jsEvent.preventDefault()
        Turbolinks.visit(info.event.extendedProps.show_url)
      },
      eventDrop: function (info) {
        let data = _this.data(info)
        Rails.ajax({
          type: 'PUT',
          url: info.event.url,
          data: new URLSearchParams(data).toString()
        })
      },
      eventResize: function (info) {
        let data = _this.data(info)
        Rails.ajax({
          type: 'PUT',
          url: info.event.url,
          data: new URLSearchParams(data).toString()
        })
      },
    })
    calendar.render()
  }

  data(info) {
    return {
      "task[start_time]": info.event.start,
      "task[end_time]": info.event.end,
    }
  }
}