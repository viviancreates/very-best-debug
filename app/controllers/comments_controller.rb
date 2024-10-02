class CommentsController < ApplicationController
  
  def create

    # /insert_comment_record?query_venue_id=11&query_author_id=wdew&query_body=wedewd" 
    #input_venue_id = params.fetch("query_venue_id")
    #input_author_id = params.fetch("query_author_id")
    #input_comment = params.fetch("query_body")
    
    #new_comment = Comment.new
    #new_comment.venue_id = input_venue_id
   # new_comment.author_id = input_author_id
    #new_comment.body = input_comment
    #new_comment.save

    #matching_venues = Venue.where(id => input_venue_id)
    #venue = matching_comments.first

  #next_url = "/photos/" + the_photo.id.to_s
  #redirect_to(next_url)

    #redirect_to("/venues/#{venue.id}")

    render({ :template => "comment_templates/create"})
  end
end
