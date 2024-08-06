import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {},
  disconnected() {},
  received(data) {
    if (Notification.permission === 'granted') {
      var title = 'FieldGood Notification'
      var body = data
      var options = { body: body }
      new Notification(title, options)
    }
  }
});

