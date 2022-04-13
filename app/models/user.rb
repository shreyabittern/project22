class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :posts
 #before_create :confirmation_token
has_many :authentications, dependent: :destroy
validates :email, :uniqueness => {:allow_blank => true}
end
