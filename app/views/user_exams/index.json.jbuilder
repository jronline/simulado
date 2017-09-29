json.array!(@user_exams) do |user_exam|
  json.extract! user_exam, :id, :title, :user_id, :area_id, :date_application
  json.url user_exam_url(user_exam, format: :json)
end
