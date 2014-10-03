App.Place = DS.Model.extend({
  name: DS.attr('string'),
  kind: DS.attr('string'),
  logo_url: DS.attr('string'),
  url: DS.attr('string'),
  twitter_name: DS.attr('string'),
  description: DS.attr('string'),
  address: DS.attr('string'),
  zipCode: DS.attr('string'),
  city: DS.attr('string', { defaultValue: 'new' }),
  lat: DS.attr('string'),
  lon: DS.attr('string'),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date')
})
