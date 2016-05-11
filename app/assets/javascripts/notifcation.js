function notify(sender, message){
  if (Notification.permission !== 'denied') {
    Notification.requestPermission();
  }
  opts = {
    icon: "/favicon-96x96.png",
    body: message
  }
  title = sender + " said:"
  new Notification(title, opts);
}
