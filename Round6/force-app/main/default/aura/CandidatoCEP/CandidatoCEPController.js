({
  doInit: function (component, event, helper) {
    helper.doInit(component);
  },

  increment: function (component, event, helper) {
    helper.increment(component, event);
  },

  cancelClick: function (component, event, helper) {
    $A.get("e.force:closeQuickAction").fire();
  },

  saveClick: function(component, event, helper) {
      helper.save(component);
  }
});
