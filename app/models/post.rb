class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
   
    belongs_to :user, foreign_key: 'user_id'
    has_many :comments
    has_many :likes, inverse_of: :post
    validates :user_id, presence: true
    validates :image, :title, presence: true
    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id }
    end

end
