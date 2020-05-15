class Comment < ApplicationRecord
    validates :body, presence: true
    
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

    has_many :likes,
        dependent: :destroy,
        as: :liked_media

    has_many :likers,
        through: :likes,
        source: :liker 
end
