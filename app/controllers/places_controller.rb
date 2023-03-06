class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = 
    Post.where( { "user_id" => session["user_id"] ,  "place_id" => @place["id"] })
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
      @place = Place.new
      @place["name"] = params["place"]["name"]
      @place.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/"
  end

end
