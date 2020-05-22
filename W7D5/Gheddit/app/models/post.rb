# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :bigint
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord

    validates :title, :content, :sub_id, :author_id, presence: true

    ##############ASSOCIATIONS#######################################

    has_many :subs, through: :post_subs, source: :sub

    belongs_to :author, foreign_key: :author_id, class_name: :User

    has_many :post_subs


end
