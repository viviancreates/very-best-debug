class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/venue_list" })
  end

  def show
    # Parameters: {"an_id"=>"4"}
    venue_id = params.fetch("an_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.at(0)

    render({ :template => "venue_templates/details" })
  end

  def create
    
    input_address = params.fetch("query_address")
    input_name = params.fetch("query_name")
    input_neighborhood = params.fetch("query_neighborhood")
    
    new_venue = Venue.new

    #these come from the model
    new_venue.address = input_address
    new_venue.name = input_name
    new_venue.neighborhood = input_neighborhood


    new_venue.save

    redirect_to("/venues/"+ new_venue.id.to_s)
  end
  
  def update
    the_id = params.fetch("the_id")
    matching_venues = Venue.where(:id => the_id)
    the_venue = matching_venues.at(0)

    the_venue.address = params.fetch("query_address")
    the_venue.name = params.fetch("query_name")
    the_venue.neighborhood = params.fetch("query_neighborhood")
    the_venue.save
    next_url = "/venues/#{the_venue.id}"
    redirect_to(next_url)
  end

  def destroy
    the_id = params.fetch("id_to_delete")
    matching_venues = Venue.where({ :id => the_id })
    the_venue = matching_venues.at(0)
    the_venue.destroy

    redirect_to("/venues")
  end

end
