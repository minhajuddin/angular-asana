/* Services */
AA.ngAsana.factory('Task', function($resource){
  return $resource('tasks/:id', {id: '@id'}, {
    'update': {method: 'PUT'}
  }, 'task')
})

AA.ngAsana.factory('Session', function($resource) {
  function SessionService() {
    navigator.id.watch({
      loggedInUser: null,
      onlogin: function(assertion) {
        console.log('verifying');
      },
      onlogout: function() {
        console.log('loggedout');
      }
    });

    this.newSession = function() {
      navigator.id.request();
    };

    this.destroySession = function() {
      navigator.id.logout();
    }
  };
  return new SessionService();
});
