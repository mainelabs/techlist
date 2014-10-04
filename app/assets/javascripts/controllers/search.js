App.SearchController = Ember.ArrayController.extend({
  itemController: 'kind',
  actions : {
    checkboxChanged: function(e, kind) {
      console.log('Clicked', e, kind);
    }
  }
});
