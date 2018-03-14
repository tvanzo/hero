class FollowersController < ApplicationController
    def create
        @following=Following.new(follower_id:current_user.id, following_id:"#{params[:id]}")
        @following.save
        redirect_to request.referrer

    end
    
    def destroy
        @following=Following.find_by(follower_id:current_user.id, following_id:"#{params[:id]}")
        @following.destroy
        redirect_to request.referrer
    end
end
