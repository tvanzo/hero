class WallpostsController < ApplicationController
      def index
    
    @posts=Post.where(youtuber: params[:id]).order(created_at: :desc)
    @post=Post.new
    @youtuber=params[:id]
    end
   



  def new
     @post = Post.new
     
  end
  
  def show
   
     @post = Wallpost.find_by(id: params[:id])
     @user = @Wallpost.user
     @likes_count = Like.where(post_id: @post.id).count
     @comment=Comment.new
    
  end
  
  def create
    @post = Wallpost.new(
      youtuber: params[:id],
      content: params[:content],
      user_id: current_user.id
    )
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to("/#{params[:id]}")
    else
      render("posts/new")
    end
  end
  
  def destroy
  @post=Wallpost.find_by(id:params[:id])
    @post.destroy
    flash[:notice] = "Post successfully deleted"
    redirect_to("/posts")
  end
  

  def index
     @post = Wallpost.new(
      youtuber: params[:id],
      content: params[:content],
      user_id: current_user.id
    )
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to("/#{params[:id]}/wall")
    else
      render("posts/new")
    end
  end
end
