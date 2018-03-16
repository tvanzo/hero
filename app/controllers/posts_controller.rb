class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
  
   
     @posts=Post.all.order(created_at: :desc)
    @post=Post.new

    
end
  def asked
  @posts=Post.all.order(created_at: :desc)
    @post=Post.new
end



  def new
     @post = Post.new
     
  end
  
  def show
   
     @post = Post.find_by(id: params[:id])
     @user = @post.user
     @likes_count = Like.where(post_id: @post.id).count
     @comment=Comment.new
    
  end
  
  def create
    @post = Post.new(
      youtuber: params[:youtuber],
      content: params[:content],
      user_id: current_user.id
    )
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
  def destroy
  @post=Post.find_by(id:params[:id])
    @post.destroy
    flash[:notice] = "Post successfully deleted"
    redirect_to("/posts")
  end
end
