class LikeComment < ApplicationRecord
    validates_uniqueness_of :user_id, :scope => [:comment_id]
end
