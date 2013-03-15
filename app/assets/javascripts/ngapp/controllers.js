/* Controllers */

AA.ngAsana.controller('TasksCtrl', function($scope, Task) {

  $scope.tasks = Task.query(function(tasks) {
    $scope.selectedTask = tasks[0]
  })

  $scope.save = function(task) {
    if (task.id) {
      task.$update()
    } else {
      task.$save()
    }
  }

  $scope.selectTask = function(task) {
    $scope.selectedTask = task
  }

  $scope.addNewTaskBelow = function(task) {
    var i, len;
    for (i = 0, len = $scope.tasks.length; i < len; i++) {
      if ($scope.tasks[i] == task) {
        break;
      }
    }
    var t = new Task({
      title: '',
      description: '',
      completed: false,
      comments: []
    });
    console.log('adding task at', i)
    $scope.tasks.splice(i + 1, 0, t)
    $scope.selectedTask = t;
  };

  $scope.addComment = function(task) {
    task.comments.push({
      text: $scope.newComment.text
    })
    task.$update()
    $scope.newComment = {}
  }
});

