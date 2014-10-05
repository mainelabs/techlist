App.PlacesController = Ember.ArrayController.extend({
  needs: 'search',

  actions : {
    click: function(place) {
      this.transitionToRoute('place', place)
    }
  },

  places: function() {
    return this.get('controllers.search.filters').length ? this.get('filteredPlaces') : this ;
  }.property('places', 'controllers.search.filters'),

  filteredPlaces: function() {
    filters = this.get('controllers.search.filters');
    return this.filter(function(place) {
      return filters.indexOf(place.get('kind')) !== -1;
    });
  }.property('places')
});
