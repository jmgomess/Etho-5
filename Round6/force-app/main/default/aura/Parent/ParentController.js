({
  handleComponentEvent: function (component, event, helper) {
    var random = Math.random() * 100;
    component.set("v.mensagem", "" + random);
  }
});
