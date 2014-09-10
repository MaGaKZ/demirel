json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :content, :subject_id, :user_id
  json.url assignment_url(assignment, format: :json)
end
