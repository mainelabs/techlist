(function($) {
  $.fn.live_search = function(results, reset) {
    new LiveSearch(this, results, reset);
    return this;
  }

  class LiveSearch {
    constructor(el, results, reset) {
      this.el = el;
      this.results = results;
      this.reset = reset;
      this.form = this.el.closest('form');
      this.url = this.form.attr('action');

      this.el
        .on('focus', () => this.select())
        .on('input', () => this.search());
    }

    select() {
      this.el.select();
    }

    search() {
      this._cancel_debounced();

      if (!this.el.val().length) {
        this._reset_results();
      } else {
        this._execute_search();
      }
    }

    _reset_results() {
      if (this._has_reset_node()) {
        this._hide_results();
      } else {
        this._execute_search();
      }
    }

    _execute_search() {
      this._debounce(() => {
        $.get(this.url, this.form.serialize()).always((response) => {
          var [count, response] = this._parse_response(response);

          if (count > 0) {
            this._show_results(response);
          } else {
            this._debounce(() => this._show_results(response));
          }
        });
      });
    }

    _debounce(callback) {
      this.timer = setTimeout(() => callback.apply(this), 500);
    }

    _cancel_debounced() {
      if (this.timer) {
        clearTimeout(this.timer);
      }
    }

    _parse_response(response) {
      var response = $(response.responseText);
      return [
        response.find('#places-count').data('count'),
        response
      ]
    }

    _show_results(content) {
      if (this._has_reset_node()) {
        this.reset.hide();
      }
      this.results
        .show()
        .html(content);
    }

    _hide_results() {
      if (this._has_reset_node()) {
        this.reset.show();
      }
      this.results.hide();
    }

    _has_reset_node() {
      return this.reset.length > 0
    }
  }
}(jQuery));
