class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
         
      
   
         def posts
         return Post.where(user_id: self.id)
        end
        
        def likes
         return Like.where(user_id: self.id)
        end
        
       
        
        def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
     unless user
         user = User.create(
            email: data['email'],
            password: Devise.friendly_token[0,20],
            image: data['image'],
            first_name: data['first_name'],
            last_name: data['last_name']

         )
     end
    user
end
        
       
    

end
