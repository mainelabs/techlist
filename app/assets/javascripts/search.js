$(document).on('ready page:load', function() {
  var throttle;

  $('#search')
    // Select input content on focus
    .on('focus', function() {
      this.select();
    })

    // Launch delayed search on user input
    .on('input', function() {
      if (!this.value.length && $('#no-search').length) {
        $('#no-search').show();
        $('#search-results').hide();
      } else {
        if (throttle) {
          // Reset pending request or results display
          clearTimeout(throttle);
        }

        // Delay the search to let the user continue typing
        var self = this;
        throttle = setTimeout(function() {
          var $form = $(self).closest('form');

          $.get($form.attr('action'), $form.serialize()).always(function(response) {
            var $response = $(response.responseText);
            var count = $response.find('#places-count').data('count');

            if (count > 0) {
              showResults($response);
            } else {
              // Delay the 0 results display to let the user continue typing
              throttle = setTimeout(function() {
                showResults($response);
              }, 500);
            }
          });
        }, 500);
      }
    });

    var showResults = function($response) {
      $('#no-search').hide();
      $('#search-results')
        .show()
        .html($response);
    };
});
