App.KindController = Ember.ObjectController.extend({
  actions: {
    // This shouldn't be necessary, we should use attr binding here, but I can't make it work, right now
    change : function() {
      model = this.get('model');
      model.set('isSelected', model.get('isSelected') ? false : true);
    }
  }
});
