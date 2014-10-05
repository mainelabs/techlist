App.PlacesController = Ember.ArrayController.extend({
  needs: 'places_search',

  actions : {
    click: function(place) {
      this.transitionToRoute('place', place)
    }
  },

  places: function() {
    return this.get('controllers.places_search.filters').length ? this.get('filteredPlaces') : this ;
  }.property('places', 'controllers.places_search.filters'),

  filteredPlaces: function() {
    filters = this.get('controllers.places_search.filters');
    return this.filter(function(place) {
      return filters.indexOf(place.get('kind')) !== -1;
    });
  }.property('places')
});
