json.extract! listing, :id, :title, :name, :condition, :price, :description, :created_at, :updated_at
json.url listing_url(listing, format: :json)
