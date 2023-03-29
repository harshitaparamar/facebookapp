class User < ApplicationRecord
  mount_uploader :profile_image, ImageUploader

  has_many :posts, inverse_of: :user
  has_many :likes
  enum role: { admin:1, user:2 }
   
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def admin?
    role == 'admin'
  end
  
end
