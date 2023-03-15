class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
   
    belongs_to :user, foreign_key: 'user_id'
    has_many :comments
    has_many :likes
    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id }
    end

end
