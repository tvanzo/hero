class Like < ApplicationRecord
    validates :user_id,{presence:true}
  validates :post_id,{presence:true}
  validates_uniqueness_of :user_id, :scope => [:post_id]
end
