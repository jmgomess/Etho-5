({
  handleChange: function (component, event, helper) {
    var cmpEvent = component.getEvent("childrenToParent");
    cmpEvent.fire();
  }
});
