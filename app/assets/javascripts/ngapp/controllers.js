/* Controllers */

AA.ngAsana.controller('TasksCtrl', function($scope, Task) {
  $scope.tasks = Task.query()
});

