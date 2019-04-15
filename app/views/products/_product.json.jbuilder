json.extract! product, :id, :name, :item_id, :inventory, :created_at, :updated_at
json.url product_url(product, format: :json)
