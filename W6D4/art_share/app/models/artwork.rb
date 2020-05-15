# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  img_url    :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence:true, uniqueness:{scope: :artist_id}
    validates :img_url, presence:true
    validates :artist_id, uniqueness:{scope: :title}

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User 

    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :shares,
        source: :viewer

    has_many :comments,
        dependent: :destroy,
        foreign_key: :artwork_id,
        class_name: :Comment

    has_many :likes,
        dependent: :destroy,
        as: :liked_media
    
    has_many :likers,
        through: :likes,
        source: :liker 

    has_many :collection_memberships,
        dependent: :destroy,
        foreign_key: :artwork_id,
        class_name: :CollectionMember
end
