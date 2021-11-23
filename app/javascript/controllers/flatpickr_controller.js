import Flatpickr from 'stimulus-flatpickr'

// import a theme (could be in your main CSS entry too...)
import 'flatpickr/dist/themes/material_orange.css'

import rangePlugin from 'flatpickr/dist/plugins/rangePlugin.js'

// create a new Stimulus controller by extending stimulus-flatpickr wrapper controller
export default class extends Flatpickr {

  connect() {
    this.config = {
      mode: 'range',
      plugins: [new rangePlugin({ input: "#secondRangeInput" })]
    }
    super.connect()
  }};
