import { Controller } from "stimulus";
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import bootstrapPlugin from '@fullcalendar/bootstrap';

export default class extends Controller {
  static targets = ['calendar']

  connect() {
    let calendar = new Calendar(this.calendarTarget,{
      plugins: [ dayGridPlugin, bootstrapPlugin ],
      themeSystem: 'bootstrap'
    })

    calendar.render();
  }
}
