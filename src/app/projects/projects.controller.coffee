angular.module 'app.projects'
  .controller 'ProjectsController', ($scope, Project) ->
    $scope.list = Project.query()
