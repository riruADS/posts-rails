class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    if @post.save
      ActionCable.server.broadcast 'post_channel', title: @post.title
      redirect_to posts_path
    else
      render 'new'
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:is_private, :title)
    end
end
