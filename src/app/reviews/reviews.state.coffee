angular.module 'app.reviews'
  .config ($stateProvider) ->
    $stateProvider.state 'reviews', {
      url: '/reviews'
      templateUrl: 'app/reviews/reviews.html'
      controller: 'ReviewsController'
    }
