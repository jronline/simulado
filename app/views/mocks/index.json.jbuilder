json.array!(@mocks) do |mock|
  json.extract! mock, :id, :title, :year, :edition, :application_date, :notice, :institution_id, :organizer_id, :category_id, :area_id
  json.url mock_url(mock, format: :json)
end
