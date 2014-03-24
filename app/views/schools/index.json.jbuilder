json.array!(@schools) do |school|
  json.extract! school, :id, :name, :address, :city, :zip, :county, :phone_number, :rating, :grade_level, :url, :is_religious, :latitude, :longitude
  json.url school_url(school, format: :json)
end
