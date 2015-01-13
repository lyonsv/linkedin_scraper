json.array!(@educations) do |education|
  json.extract! education, :id, :name, :description, :period, :contact_id
  json.url education_url(education, format: :json)
end
