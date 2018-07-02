class User < ApplicationRecord

     #has_many :microposts
     before_save { self.email = email.downcase }
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     validates :name,  presence: true, length: { maximum: 50 }
     validates :email, presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }
                       
                       
     has_secure_password # The only requirement for has_secure_password to work its magic is for the corresponding model to have an attribute called password_digest
     #rails generate migration add_password_digest_to_users password_digest:string
     validates :password, presence: true, length: { minimum: 6 }
end
