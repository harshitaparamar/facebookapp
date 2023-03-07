class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :title, presence: true, length: {minimum: 2}
    validates :body, presence: true
    validates :image, file_size: { less_than: 1.megabytes }

    belongs_to :user, foreign_key: 'user_id'

end
