json.extract! service, :id, :name, :description, :kind, :phone_number, :url, :street, :city, :state, :zip :picture, :created_at, :updated_at
json.url customer_url(service, format: :json)