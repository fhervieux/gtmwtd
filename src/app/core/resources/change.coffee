angular.module 'app.core'
  .factory 'Change', ($http) ->
    query: () ->
      $http.get "http://localhost:8080/changes/?o=DETAILED_ACCOUNTS&o=MESSAGES&o=ALL_REVISIONS"
