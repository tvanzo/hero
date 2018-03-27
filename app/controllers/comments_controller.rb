class CommentsController < ApplicationController
    
     def create
     post= Post.find_by(id: params[:id]).id
    @comment = Comment.new(
      content: params[:content],
      user_id: current_user.id,
      post_id: post
    )
    if @comment.save
        redirect_to request.referrer
    end
end
end