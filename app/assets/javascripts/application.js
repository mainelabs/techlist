//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree ./components
//= require_self

$(document).on('turbolinks:load', function() {
  // Use turbolinks to submit search form
  $('.search-form').on('submit', function(event) {
    Turbolinks.visit(this.action + '?' + $(this).serialize());
    event.preventDefault();
  });

  $('.place-map').mapWithMarker();
});
