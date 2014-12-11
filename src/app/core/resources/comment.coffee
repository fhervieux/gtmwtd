angular.module 'app.core'
  .factory 'Comment', ($resource) ->
    $resource 'http://localhost:8080/changes/:changeId/revisions/:revisionId/comments/:commentId', {}, {
      query: {
        method: 'GET'
        params: {
          commentId: ''
        }
        isArray: true
      }
    }
