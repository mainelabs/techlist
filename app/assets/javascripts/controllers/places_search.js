App.PlacesSearchController = Ember.ArrayController.extend({
  filters: [],

  updateFilters : function(kind) {
    // This could be far more elegant
    active_filters = []
    this.get('content').forEach(function(kind) {
      if (kind.get('isSelected')) {
        active_filters.push(kind.id);
      }
    });
    this.set('filters', active_filters);
  }.observes('@each.isSelected')
});
