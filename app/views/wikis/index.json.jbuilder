json.array!(@wikis) do |wiki|
  json.extract! wiki, :article_location, :article_url
  json.url wiki_url(wiki, format: :json)
end
