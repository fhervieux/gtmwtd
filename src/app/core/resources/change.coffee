angular.module 'app.core'
  .factory 'Change', ($resource) ->
    $resource 'http://localhost:8080/changes/:changeId', {}, {
      query: {
        method: 'GET'
        params: {
          changeId: ''
          o: ['DETAILED_ACCOUNTS', 'MESSAGES', 'ALL_REVISIONS']
        }
        isArray: true
      }
    }
