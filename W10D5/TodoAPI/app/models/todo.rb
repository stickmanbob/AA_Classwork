class Todo < ApplicationRecord

   validates :title, presence:true, uniqueness:true 
   validates :body, presence:true 
   validates :done, inclusion:{in:[true,false]}

end
