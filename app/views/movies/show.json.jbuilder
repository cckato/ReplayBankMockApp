json.extract! @movie, :id, :name, :introduction
json.thub 'http://' + request.host_with_port + @movie.body_url(:thumb)
json.created_at @movie.created_at.strftime("%Y/%m/%d %H:%M")
json.user do
  json.id @movie.user.id
  json.name @movie.user.name
  json.unique_name @movie.user.unique_name
  json.image 'http://' + request.host_with_port + @movie.user.image_url(:thumb_m)
end
json.set! :comments do
  json.array! @movie.comments do |comment|
    json.body comment.body
    json.created_at comment.created_at.strftime("%Y/%m/%d %H:%M")
    json.user do
      json.id comment.user.id
      json.unique_name comment.user.unique_name
      json.name comment.user.name
      json.image "http://" + request.host_with_port + comment.user.image_url(:thumb_m)
    end
  end
end