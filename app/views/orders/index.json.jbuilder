json.array!(@orders) do |order|
  json.extract! order, :id, :street, :city, :state, :apt, :zip_code, :country
  json.url order_url(order, format: :json)
end
