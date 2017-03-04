json.array!(@questions) do |question|
  json.extract! question, :id, :number, :type, :veracity, :exam_id
  json.url question_url(question, format: :json)
end
