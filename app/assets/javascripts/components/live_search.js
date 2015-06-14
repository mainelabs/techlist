(function($) {
  $.fn.live_search = function(results, reset) {
    new LiveSearch(this, results, reset);
    return this;
  }

  LiveSearch = function(el, results, reset) {
    this.el = el;
    this.results = results;
    this.reset = reset;
    this.form = this.el.closest('form');
    this.url = this.form.attr('action');

    var self = this;

    this.el
      .on('focus', function() { self.select() })
      .on('input', function() { self.search() });

    this.select = function() {
      this.el.select();
    };

    this.search = function() {
      this._cancel_debounced();

      if (!this.el.val().length) {
        this._reset_results();
      } else {
        this._execute_search();
      }
    };

    this._reset_results= function() {
      if (this._has_reset_node()) {
        this._hide_results();
      } else {
        this._execute_search();
      }
    };

    this._execute_search = function() {
      this._debounce(function() {
        $.get(self.url, self.form.serialize()).always(function(response) {
          var parsed_response = self._parse_response(response);

          if (parsed_response[0] > 0) {
            self._show_results(parsed_response[1]);
          } else {
            self._debounce(function() { self._show_results(parsed_response[1]) });
          }
        });
      });
    };

    this._debounce = function(callback) {
      this.timer = setTimeout(function() { callback.apply(self) }, 500);
    };

    this._cancel_debounced = function() {
      if (this.timer) {
        clearTimeout(this.timer);
      }
    };

    this._parse_response = function(response) {
      var response = $(response.responseText);
      return [
        response.find('#places-count').data('count'),
        response
      ]
    };

    this._show_results = function(content) {
      if (this._has_reset_node()) {
        this.reset.hide();
      }
      this.results
        .show()
        .html(content);
    };

    this._hide_results = function() {
      if (this._has_reset_node()) {
        this.reset.show();
      }
      this.results.hide();
    };

    this._has_reset_node = function() {
      return this.reset.length > 0
    };
  }
}(jQuery));
