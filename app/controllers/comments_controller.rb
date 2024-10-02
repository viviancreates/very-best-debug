class CommentsController < ApplicationController
  
  def create
    input_venue_id = params.fetch("query_venue_id")
    input_author_id = params.fetch("query_author_id")
    input_comment = params.fetch("query_body"_
    
    new_comment = Comment.new
    new_comment.venue_id = input_venue_id
    new_comment.author_id = input_author_id
    new_comment.body = input_body
    new_comment.save
    
    #matching_photos = Photo.where(id: input_photo_id)
    #the_photo = matching_photos.first

    next_url = "/venues/" + the_comment.venue_id.to_s
    redirect_to(next_url)
  end
end
