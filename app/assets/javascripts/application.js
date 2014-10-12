//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require leaflet-dist
//= require ember-leaflet
//= require leaflet.markerclusterer/dist/leaflet.markercluster
//= require showdown
//= require_self
//= require ./app

// for more details see: http://emberjs.com/guides/application/
App = Ember.Application.create({rootElement: '#ember-app'})

App.showdown = new Showdown.converter();

Ember.Handlebars.helper('markdown', function(input) {
  if (!input) return '' ;
  return new Ember.Handlebars.SafeString(App.showdown.makeHtml(input))
});
