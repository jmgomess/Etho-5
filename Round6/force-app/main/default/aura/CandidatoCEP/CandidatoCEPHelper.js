({
  doInit: function (component) {},

  increment: function (component, event) {
    var buttonLabel = parseInt(component.find("button1").get("v.label"));
    var increment = buttonLabel + 1;

    component.find("button1").set("v.label", increment);
  },

  save: function (cmp) {
    var action = cmp.get("c.saveRecord");
    action.setParams({
      recordId: cmp.get("v.recordId"),
      cep: cmp.get("v.cep")
    });

    action.setCallback(this, function (response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        alert("From server: " + response.getReturnValue());
      } else if (state === "INCOMPLETE") {
      } else if (state === "ERROR") {
        var errors = response.getError();
        if (errors) {
          if (errors[0] && errors[0].message) {
            console.log("Error message: " + errors[0].message);
          }
        } else {
          console.log("Unknown error");
        }
      }
    });
    $A.enqueueAction(action);
  }
});
