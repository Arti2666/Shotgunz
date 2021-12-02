import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { chatroomId: Number }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this._insertMessage(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`);
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  _insertMessage(data) {
    this.element.insertAdjacentHTML("beforeend", data)
    const lastMessage = document.querySelector('.message:last-of-type')
    lastMessage.scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"});
    document.querySelector('#message_content').value = '';
  }
}
