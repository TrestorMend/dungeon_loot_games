json.array!(@clients) do |client|
  json.extract! client, :id, :first_name, :last_name, :address, :email, :phone, :province
  json.url client_url(client, format: :json)
end
