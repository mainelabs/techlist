App.PlaceController = Ember.ObjectController.extend({
  actions : {
    close: function() {
      this.transitionToRoute('places')
    }
  }
});
