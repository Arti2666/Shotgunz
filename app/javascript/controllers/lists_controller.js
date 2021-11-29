import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["buttonPub", "buttonPriv", "buttonMyShot", "prublicDiv", "privateDiv", "myShotDiv"]

  connect() {
    console.log("connecté ?");
  }

  togglePublic(event) {
    console.log(event)
    this.publicDivTarget.classList.remove("d-none");
    this.privateDivTarget.classList.add("d-none");
    this.myShotDivTarget.classList.add("d-none");
  }

};
