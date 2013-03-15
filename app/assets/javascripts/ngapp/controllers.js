/* Controllers */

AA.ngAsana.controller('TasksCtrl', function($scope, Task) {
  $scope.tasks = Task.query()
  $scope.save = function(task){
    task.$update()
  }
});

