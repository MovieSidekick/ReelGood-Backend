json.user do
  json.body @review.body
  json.user_id @review.user_id
  json.movie_id @review.movie_id
end