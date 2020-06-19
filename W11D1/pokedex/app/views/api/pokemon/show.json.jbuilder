json.set! 'pokemon' do
    
        json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :item_ids 
        json.image_url asset_path("/pokemon_snaps/#{@pokemon.image_url}")

        # json.array! @pokemon.items do |item|
    #     json.extract! item, :id
    # end
end

#what is going on with item_ids, rails magic?

json.set! "items" do
    @pokemon.items.each do |item|
        json.set! item.id do
            json.id item.id 
            json.name item.name
            json.pokemon_id item.pokemon_id
            json.price item.price 
            json.happiness item.happiness
            json.image_url item.image_url 
        end
    end
end
