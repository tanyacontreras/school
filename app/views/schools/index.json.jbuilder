json.schools do |json|
json.array!(@schools) do |school|
  json.extract! school, :id, :name, :address, :city, :zip, :latitude, :longitude
  json.url school_url(school, format: :json)
	end
end





