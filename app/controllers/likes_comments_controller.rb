class LikesCommentsController < ApplicationController
    def create
    # Define the @like variable
    @like=LikeComment.new(user_id:current_user.id, comment_id:params[:comment_id])
    
    # Save the @like variable
    @like.save
    
    # Redirect to the "Post details" page
    redirect_to request.referrer
  
  end
  
  def destroy
    @like=LikeComment.find_by(user_id:current_user.id, comment_id:params[:comment_id])
    @like.destroy
    redirect_to request.referrer
  end
    
end
