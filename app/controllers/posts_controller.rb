class PostsController < ApplicationController

  before_filter :authorize, only: [:edit, :update, :destroy, :create]

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/users/#{@post.user_id}", notice: "Post added!"
    else
      render new_user_post_path(@post.user_id)
    end
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit(:user_id, :content, :title, :photo)
  end
end
