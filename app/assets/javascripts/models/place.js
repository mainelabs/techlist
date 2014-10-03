TechlistApp.Place = Ember.Object.extend();

TechlistApp.Place.reopenClass({
  all: function() {
      return $.getJSON('api/v1/places.json').then(function(response) {
        var places = [];

        response.forEach( function (data) {
          places.push( TechlistApp.Place.create(data) );
        });

        return places;
      });
  }
});
