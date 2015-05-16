//= require jquery
//= require turbolinks
//= require_tree ./components
//= require_self

$(document).on('ready page:load', function() {
  $('#search').live_search($('#search-results'), $('#no-search'));
});
