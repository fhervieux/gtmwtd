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
        gerritComments = (Comment.getComments(change.id, revisionId) for revisionId, revision of change.revisions)
        comments = []
        $q.all(gerritComments).then (results) ->
          for gerritComment in results
            for file, fileComments of gerritComment.data
              for comment in fileComments
                comments.push {
                  id: comment.id
                  message: comment.message
                  timestamp: comment.updated
                }
          comments