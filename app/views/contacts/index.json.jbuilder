json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :notes, :headline, :first_name, :last_name, :title, :summary, :location, :country, :industry, :picture_url
  json.url contact_url(contact, format: :json)
end
