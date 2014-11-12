json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :introduction, :user_id
  json.thumb "http://" + request.host_with_port + movie.body_url
  json.url movie_url(movie, format: :json)
end
