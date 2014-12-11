reviewPattern = /^Patch Set (\d+):( Code-Review([+-]?\d))?(\s+\((\d+) comment\))?(\s+(.*))?/

angular.module 'app.core'
  .factory 'NewsService', ($http, $q, Comment) ->
      getNews: (change, limit) ->
        news = []
        for index, message of change.messages
          moment(message.date)
          if reviewMatch = reviewPattern.exec(message.message)
            news.push {
              type: 'REVIEW'
              revision: reviewMatch[1]
              grade: reviewMatch[3]
              comments: reviewMatch[5]
              reply: reviewMatch[7]
#              match: reviewMatch
            }
        news

      getNews2: (change, limit) ->
        console.log(change.id)
        comments = (Comment.get({ changeId: change.id, revisionId: revisionId }).$promise for revisionId, revision of change.revisions)
        $q.all(comments).then (results) ->
          for res in results
            console.log(res)
        console.log(comments)
        comments
