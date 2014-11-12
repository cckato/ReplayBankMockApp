json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :introduction, :user_id
  json.thumb "http://" + request.host_with_port + movie.body_url(:thumb)
  json.created_at movie.created_at.strftime("%Y/%m/%d %H:%M")
  json.user do
    json.name movie.user.name
    json.image "http://" + request.host_with_port + movie.user.image_url(:thumb)
  end
end
