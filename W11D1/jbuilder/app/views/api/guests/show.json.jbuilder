json.partial! 'guest', guest: @guest

json.gifts @guest.gifts.each do |gift|
    json.set! gift.id do 
        json.title gift.title
        json.description gift.description
    end
end

#wut
#could put partial here

#gifts{
#    1: {
#        title: "whatever title is",
#        description: "whatever description is"
#    }
#}

