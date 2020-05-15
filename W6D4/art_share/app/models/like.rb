class Like < ApplicationRecord
    validates :liker_id, presence: true, uniqueness: { scope: [:liked_media_id, :liked_media_type] }

    belongs_to :liker,
        foreign_key: :liker_id,
        class_name: :User

    belongs_to :liked_media,
        polymorphic: true
end
