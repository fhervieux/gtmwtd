angular.module 'app.core'
  .config ($resourceProvider) ->
    $resourceProvider.defaults.stripTrailingSlashes = false
