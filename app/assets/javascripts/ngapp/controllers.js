/* Controllers */

AA.ngAsana.controller('TasksCtrl', function($scope, Task) {

  $scope.tasks = Task.query(function(tasks){
    $scope.selectedTask = tasks[0]
  })

  $scope.save = function(task){
    task.$update()
  }

  $scope.selectTask = function(task){
    $scope.selectedTask = task
  }
});
