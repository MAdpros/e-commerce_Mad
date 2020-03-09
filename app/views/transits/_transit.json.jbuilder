json.extract! transit, :id, :name, :mode, :price, :created_at, :updated_at
json.url transit_url(transit, format: :json)
