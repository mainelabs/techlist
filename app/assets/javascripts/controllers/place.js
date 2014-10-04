App.PlaceController = Ember.Controller.extend({
  actions : {
    close: function() {
      this.transitionToRoute('places')
    }
  }
});
