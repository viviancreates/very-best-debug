class CommentsController < ApplicationController
  
  def create
    # /insert_comment_record?query_venue_id=11&query_author_id=wdew&query_body=wedewd" 
    
    new_comment = Comment.new
    new_comment.venue_id = params.fetch("query_venue_id")
    new_comment.author_id = params.fetch("query_author_id")
    new_comment.body = params.fetch("query_body")
    new_comment.save

    redirect_to("/venues/#{new_comment.venue_id}")

  end
end
