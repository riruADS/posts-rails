class PostsController < ApplicationController
  def index
    posts_id = []
    
    Post.all.each do |post|
      if post.is_private && (post.user.friends.include?(current_user) || post.user == current_user)
        posts_id << post.id
      elsif !post.is_private
        posts_id << post.id
      end
    end
    
    @posts = Post.where(id: posts_id.flatten).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    if @post.save
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
