json.array!(@loc_images) do |loc_image|
  json.extract! loc_image, :image_location, :image_url
  json.url loc_image_url(loc_image, format: :json)
end
