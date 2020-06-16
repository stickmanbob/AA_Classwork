@pokemon.each do |poke|
  json.set! poke.id do
    json.extract! poke, :id, :name
    json.image_url asset_path("pokemon_snaps/#{poke.image_url}")
  end
end

#if it's top level we don't need to identify a key