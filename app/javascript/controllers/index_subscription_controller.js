import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {

  connect() {
    if (this.channel) {
      consumer.subscriptions.remove(this.channel)
      console.log(this.channel)
    }
    this.channel = consumer.subscriptions.create(
      { channel: "IndexChannel", id: "index" },
      { received: data => {
        const container = document.querySelector(".div-public");
        container.insertAdjacentHTML("afterbegin", data)
      }}
    )
    console.log("connect")
  }
}
