import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {
  static targets = ["dropdownContent", "openButton", "closeButton"]
  static values = { open: Boolean }

  connect() {
    console.log("show js activated")
    if (this.openValue) {
      this.openDropdown()
    } else {
      this.closeDropdown()
    }
    // this.closeButtonTarget.hidden = true
  }

  openDropdown() {
    this.dropdownContentTarget.hidden = false
    this.openButtonTarget.hidden = true
    this.closeButtonTarget.hidden = false
  }

  closeDropdown() {
    this.dropdownContentTarget.hidden = true
    this.openButtonTarget.hidden = false
    this.closeButtonTarget.hidden = true
  }
}
