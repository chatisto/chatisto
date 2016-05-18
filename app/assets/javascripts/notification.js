window.notifications = []

function notify(sender, message){
  opts = {
    icon: "/favicon-96x96.png",
    body: message
  }
  var title = sender + " said:";
  var notification = new Notification(title, opts);
  window.notifications.push(notification);
}

window.addEventListener("focus", function(){
  window.notifications.forEach(function(n){
    n.close();
  });
  window.notifications = [];
});
