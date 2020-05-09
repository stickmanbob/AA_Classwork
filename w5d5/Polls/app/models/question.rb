# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :string
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
    has_many :answer_choices,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :AnswerChoice 
    
        belongs_to :poll,
            primary_key: :id, 
            foreign_key: :poll_id,
            class_name: :Poll
        
end
