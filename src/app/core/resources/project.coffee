angular.module 'app.core'
  .factory('Project', project = ($resource) ->
    $resource 'http://localhost:8080/projects/:projectId', {}, {
      query: {
        method: 'GET'
        params: { projectId: '' }
      }
    })
