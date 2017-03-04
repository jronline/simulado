json.array!(@organizers) do |organizer|
  json.extract! organizer, :id, :title, :address, :email, :phone
  json.url organizer_url(organizer, format: :json)
end
