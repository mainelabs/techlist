//= require jquery
//= require turbolinks
//= require_tree ./components
//= require_self

$(document).on('ready page:load', function() {
  $('.place-map').mapWithMarker();
});
