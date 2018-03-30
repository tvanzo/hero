class Wallpost < ApplicationRecord
      def user
    return User.find_by(id: self.user_id)
  end
  
  def answer
         return Answer.find_by(post_id: self.id)
  end
  
  def comments
        return Comment.where(post_id: self.id)
  end
     
     
     
     
   
end
