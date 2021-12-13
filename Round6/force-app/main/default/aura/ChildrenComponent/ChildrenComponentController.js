({
  handleComponentEvent: function (component, event, helper) {
    console.log("FILHO ESCUTOU");
    event.stopPropagation();
  }
});
