json.array!(@helper_objects) do |helper_object|
  json.extract! helper_object, :id, :title, :text, :font, :question_id
  json.url helper_object_url(helper_object, format: :json)
end
