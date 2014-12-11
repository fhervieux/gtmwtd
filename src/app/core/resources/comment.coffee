angular.module 'app.core'
  .factory 'Comment', ($http) ->
    getComments: (changeId, revisionId) ->
      $http.get "http://localhost:8080/changes/#{changeId}/revisions/#{revisionId}/comments/"
