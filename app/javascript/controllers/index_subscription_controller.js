import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "IndexChannel", id: "index" },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to the index with the id index.`);
  }
}
