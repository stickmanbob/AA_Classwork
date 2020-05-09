# == Schema Information
#
# Table name: users
#
#  id    :bigint           not null, primary key
#  email :string           not null
#
class User < ApplicationRecord

    validates :email, presence: true, uniqueness: true

    has_many :shortened_urls,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :ShortenedUrl

    has_many :visited,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Visit    

    has_many :visited_urls,
        through: :visited,
        source: :url    
end
