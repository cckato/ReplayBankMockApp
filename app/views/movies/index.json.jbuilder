json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :introduction
  json.thumb "http://" + request.host_with_port + movie.body_url(:thumb_m)
  json.created_at movie.created_at.strftime("%Y/%m/%d %H:%M")
  json.user do
    json.id :user_id
    json.name movie.user.name
    json.unique_name movie.user.unique_name
    json.image "http://" + request.host_with_port + movie.user.image_url(:thumb_m)
  end
end
