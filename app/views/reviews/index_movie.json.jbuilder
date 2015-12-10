json.review @reviews do |review|
  json.body review.body
  json.movie_id review.movie_id
  json.user_id review.user_id


end