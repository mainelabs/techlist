App.PlacesController = Ember.ArrayController.extend({
  actions : {
    click: function(place) {
      this.transitionToRoute('place', place)
    }
  }
});
