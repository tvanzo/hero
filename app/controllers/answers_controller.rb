class AnswersController < ApplicationController
    def index
        @posts=Post.all.order(created_at: :desc)
        @post=Post.new
        
    end
    def new
        @answer=Answer.new
        @post = Post.find_by(id: params[:id])
    end
    def create
    post = Post.find_by(id: params[:id]).id
    youtuber = Post.find_by(id: params[:id]).youtuber
    @answer = Answer.new(
      content: params[:content],
      user_id: current_user.id,
      post_id: post
    )
    if @answer.save
        redirect_to("/#{youtuber}")
    end
end
end
