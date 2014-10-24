json.array!(@users) do |user|
  json.extract! user, :id, :unique_name, :mail, :name, :introduction, :image, :birth_year
  json.url user_url(user, format: :json)
end
