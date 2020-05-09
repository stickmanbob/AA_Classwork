# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  url_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Visit < ApplicationRecord
    
    validates :user_id, :url_id, presence: true

    belongs_to :visitor,
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id 
    
    belongs_to :url,
        class_name: :ShortenedUrl,
        primary_key: :id,
        foreign_key: :url_id
    def self.record_visit! (user, url)
        self.create!(user_id: user.id, url_id: url.id)
        
    end


end
