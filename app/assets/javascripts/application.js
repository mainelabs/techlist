//= require jquery
//= require turbolinks
//= require_tree ./components
//= require_self

$(document).on('ready page:load', function() {
  $('#search').liveSearch($('#search-results'), $('#no-search'));
  $('.place-map').mapWithMarker();
});
