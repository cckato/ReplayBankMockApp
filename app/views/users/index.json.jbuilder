json.array!(@users) do |user|
  json.extract! user, :id, :unique_name, :mail, :name, :introduction, :birth_year
  json.image "http://" + request.host_with_port + user.image_url(:thumb)
end
