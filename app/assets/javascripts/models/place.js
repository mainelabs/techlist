App.Place = DS.Model.extend({
  name: DS.attr('string'),
  kind: DS.attr('string'),
  logo_url: DS.attr('string'),
  url: DS.attr('string'),
  twitter_name: DS.attr('string'),
  description: DS.attr('string'),
  street: DS.attr('string'),
  zipCode: DS.attr('string'),
  city: DS.attr('string'),
  latitude: DS.attr('number'),
  longitude: DS.attr('number'),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date'),

  location: function() {
    return L.latLng(this.get('latitude'), this.get('longitude'))
  }.property('latitude','longitude')
})
