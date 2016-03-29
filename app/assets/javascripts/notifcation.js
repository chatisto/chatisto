function notify(sender, message){
  if (Notification.permission !== 'denied') {
    Notification.requestPermission();
  }
  opts = {
    icon: "/chatisto.jpg",
    body: message
  }
  title = sender + " said:"
  new Notification(title, opts);
}
