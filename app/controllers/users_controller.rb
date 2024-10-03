class UsersController < ApplicationController

  def home
    render({ :template => "user_templates/all_users"})
  end

  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/all_users"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details"})
  end
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    
    redirect_to("/users/" + user.username.to_s)
  end
  
  def update
    the_id = params.fetch("user_id")
  
    the_user = User.find(the_id)
  
    input_username = params.fetch("query_username")

    the_user.update(:username => input_username)

    redirect_to("/users/#{the_user.username}")  
  end

end
