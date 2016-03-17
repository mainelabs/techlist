(function($) {
  $.fn.live_search = function(results, reset) {
    if ($(this).data('live-search') == undefined) {
      $(this).data('live-search', new LiveSearch(this, results, reset));
    }

    return this;
  }

  var LiveSearch = function(el, results, reset) {
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
      this._cancelDebounced();

      if (!this.el.val().length) {
        this._resetResults();
      } else {
        this._executeSearch();
      }
    };

    this._resetResults= function() {
      if (this._hasResetNode()) {
        this._hideResults();
      } else {
        this._executeSearch();
      }
    };

    this._executeSearch = function() {
      this._debounce(function() {
        $.get(self.url, self.form.serialize()).always(function(response) {
          var parsed_response = self._parseResponse(response);

          if (parsed_response[0] > 0) {
            self._showResults(parsed_response[1]);
          } else {
            self._debounce(function() {
              self._showResults(parsed_response[1]);
            });
          }
        });
      });
    };

    this._debounce = function(callback) {
      this.timer = setTimeout(function() { callback.apply(self); }, 500);
    };

    this._cancelDebounced = function() {
      if (this.timer) {
        clearTimeout(this.timer);
      }
    };

    this._parseResponse = function(response) {
      response = $(response.responseText);
      return [
        response.find('#places-count').data('count'),
        response
      ];
    };

    this._showResults = function(content) {
      if (this._hasResetNode()) {
        this.reset.hide();
      }
      this.results
        .show()
        .html(content);
    };

    this._hideResults = function() {
      if (this._hasResetNode()) {
        this.reset.show();
      }
      this.results.hide();
    };

    this._hasResetNode = function() {
      return this.reset.length > 0;
    };
  }
}(jQuery));
