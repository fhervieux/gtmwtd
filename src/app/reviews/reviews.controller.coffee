angular.module 'app.reviews'
  .controller 'ReviewsController', ($scope, Change, HistoryService, NewsService, Comment) ->
    Change.query().then (changes) ->
      $scope.changes = changes.data
      for change in changes.data
        NewsService.getNews(change).then (news) ->
          change._news = news
#    $scope.changes = Change.query()
    $scope.getLastGrade = (change) -> HistoryService.getLastGrade(change, 1000001)
    $scope.getNews = (change) -> NewsService.getNews2(change)
#    $scope.comments = Comment.get({ changeId: "test1~master~Idcc1b9d53479fbf4a9132ceb43ad65a397867db5", revisionId: "85ae7bbd1a12bd0fe4923b244807257c8cf50cb9" })
