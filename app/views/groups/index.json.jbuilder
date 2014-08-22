json.array!(@groups) do |group|
  json.extract! group, :id, :course, :faculty
  json.url group_url(group, format: :json)
end
