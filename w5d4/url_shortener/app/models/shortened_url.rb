# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord

    validates :long_url, :short_url, presence: true, uniqueness: true

    validates :user_id, presence:true 

    belongs_to :user, 
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User 
    
    has_many :visits,
        primary_key: :id,
        foreign_key: :url_id,
        class_name: :Visit 
    
    has_many :visitors,
        through: :visits,
        source: :visitor
    

    def self.random_code
        loop do
            new_url = SecureRandom.urlsafe_base64

            return new_url unless self.exists?(short_url: new_url)
        end
    end

    def self.create_url(user, long_url)
        short_url = self.random_code
        self.create!(long_url: long_url, short_url: short_url, user_id: user.id)
    end



    def num_clicks
        visits.length
    end

    def num_uniques
        self.visitors.select(:user_id).distinct.count

    end

    def num_recent_uniques 
        # self.visitors.select(:user_id).distinct.where("visits.time")
    end
    
end
