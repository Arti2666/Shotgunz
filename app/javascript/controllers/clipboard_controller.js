import { Controller } from 'stimulus'
export default class extends Controller {
  static targets = ['source', 'button']
  static values = { success: String }
  connect() {
    console.log(" Hello I'm there")
    console.log(this.successValue)
  }

  copy(evt) {
    console.log(evt);
    console.log(navigator);
    console.log(navigator.clipboard);
    evt.preventDefault();
    navigator.clipboard.writeText(this.sourceTarget.value)
    this.buttonTarget.innerText = this.successValue
  }}
