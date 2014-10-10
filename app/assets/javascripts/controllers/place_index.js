App.PlaceIndexController = Ember.ObjectController.extend({
  actions : {
    close: function() {
      this.transitionToRoute('places')
    }
  },

  updateUrl: function() {
    return '/places/' + this.get('id') + '/edit'
  }.property('updateUrl', 'model.id')
});
