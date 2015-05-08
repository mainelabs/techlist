//= require jquery
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

App = Ember.Application.create({rootElement: '#ember-app'});

App.ApplicationController = Ember.Controller.extend({
  needs: 'place_index',

  displayPlace : function() {
    return this.get('currentPath') == 'places.place.index';
  }.property('displayPlace','currentPath')
});

// Markdown JS
App.showdown = new Showdown.converter();
Ember.Handlebars.helper('markdown', function(input) {
  if (!input) return '' ;
  return new Ember.Handlebars.SafeString(App.showdown.makeHtml(input))
});
