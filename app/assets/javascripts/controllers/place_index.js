App.PlaceIndexController = Ember.ObjectController.extend({
  actions : {
    close: function() {
      this.transitionToRoute('places')
    }
  }
});
