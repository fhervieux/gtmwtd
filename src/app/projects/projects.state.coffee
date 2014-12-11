angular.module 'app.projects'
  .config ($stateProvider) ->
    $stateProvider.state 'projects', {
      url: '/projects'
      templateUrl: 'app/projects/projects.html'
      controller: 'ProjectsController'
    }
