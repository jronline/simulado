json.array!(@institutions) do |institution|
  json.extract! institution, :id, :title, :state
  json.url institution_url(institution, format: :json)
end
