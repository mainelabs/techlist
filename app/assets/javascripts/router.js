// For more information see: http://emberjs.com/guides/routing/
App.Router.reopen({
  location: 'auto',
  rootURL: '/'
});

App.Router.map(function() {
  this.resource('places', { path: '/' }, function() {
    this.route('search', { path: '/' });
    this.resource('place', { path: '/place/:id' });
  });
})
