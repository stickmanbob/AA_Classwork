json.extract! @party, :name, :location 

json.guests @party.guests do |guest|
    json.partial! "api/guests/guest", guest: guest
    json.gifts guest.gifts do |gift| 
        json.description gift.description
        json.title gift.title
    end
end
