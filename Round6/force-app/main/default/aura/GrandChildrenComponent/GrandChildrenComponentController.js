({
  clickButton: function (component, event, helper) {
    var cmpEvent = component.getEvent("chdEvt");
    cmpEvent.setParams({
      message:
        "A component event fired me. " +
        "It all happened so fast. Now, I'm here!",
      status: 200
    });

    cmpEvent.fire();
  }
});
