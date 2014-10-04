App.SearchRoute = Ember.Route.extend({
  model: function(params) { return this.store.find('kind') }
})
