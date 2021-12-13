({
  handleComponentEvent: function (cmp, evt) {
    var message = evt.getParam("message");
    var status = evt.getParam("status");

    cmp.set("v.message", message);
    cmp.set("v.status", status);
  }
});
