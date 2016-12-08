json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :location
  json.url person_url(person, format: :json)
end
