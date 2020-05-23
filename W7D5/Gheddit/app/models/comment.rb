# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text
#  author_id  :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord

#########################VALIDATIONS########################################
    
    ##IMPORTANT! Did not add null:false restrictions for these in DB
    :validates :author_id, :post_id, :content, presence: true

######################ASSOCIATIONS###########################

    belongs_to :author, class_name: :User
    belongs_to :post, class_name: :Post 
    
end
