App.Kind = DS.Model.extend({
  name: DS.attr('string'),
  code: DS.attr('string'),
  isSelected: DS.attr('string', { defaultValue: false })
})
