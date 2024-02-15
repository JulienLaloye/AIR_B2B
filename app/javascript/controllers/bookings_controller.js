import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookings"
export default class extends Controller {
  connect() {
    console.log("hello")
  }

  accept(event) {
    console.log(event.currentTarget)
  }

  decline() {

  }
}
