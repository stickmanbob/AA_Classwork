class Collection < ApplicationRecord
    validates :title, presence: true

    belongs_to :collector,
        foreign_key: :collector_id,
        class_name: :User

    has_many :collection_members,
        dependent: :destroy,
        foreign_key: :collection_id,
        class_name: :CollectionMember

    has_many :artworks,
        through: :collection_members,
        source: :artwork
end
