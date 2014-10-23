//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require leaflet-dist
//= require ember-leaflet
//= require leaflet.markerclusterer/dist/leaflet.markercluster
//= require leaflet-plugins/layer/tile/Google
//= require showdown
//= require_self

//= require ./store
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./templates
//= require ./router
//= require_tree ./routes

App = Ember.Application.create({rootElement: '#ember-app'})

// Markdown JS
App.showdown = new Showdown.converter();
Ember.Handlebars.helper('markdown', function(input) {
  if (!input) return '' ;
  return new Ember.Handlebars.SafeString(App.showdown.makeHtml(input))
});
