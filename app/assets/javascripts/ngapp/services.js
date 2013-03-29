/* Services */
AA.ngAsana.factory('Task', function($resource){
  return $resource('tasks/:id', 
                   {id: '@id'},
                   {'update': {method: 'PUT'}},
                   'task');
})

AA.ngAsana.factory('Session', function($resource) {
  var SessionR = $resource('/session', null, null, 'session');
  function SessionService() {
    navigator.id.watch({
      loggedInUser: null,
      onlogin: function(assertion) {
        var login = new SessionR({assertion: assertion});
        console.log(login);
        login.$save();
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
