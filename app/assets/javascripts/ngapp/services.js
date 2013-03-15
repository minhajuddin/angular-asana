/* Services */
AA.ngAsana.factory('Task', function($resource){
  return $resource('tasks/:id', {id: '@id'}, {
    'update': {method: 'PUT'}
  })
})
