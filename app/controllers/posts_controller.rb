class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    if @current_user
      @post = Post.new
      @post["body"] = params["post"]["body"]
      @post["image"] = params["post"]["image"]
      @post["user_id"] = @current_user["id"]
      @post["place_id"] = params["post"]["place_id"]
      @post.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/places/#{@post["place_id"]}"
  end
end
