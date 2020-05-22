# == Schema Information
#   This table is a joins table to allow for crossposting to multiple subs
# Table name: post_subs
#
#  id         :bigint           not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PostSub < ApplicationRecord

##################ASSOCIATIONS#########################

belongs_to :post 
belongs_to :sub 
end
