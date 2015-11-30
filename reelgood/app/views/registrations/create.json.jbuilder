json.user do
  json.id @user.id
  json.email @user.email
  json.user_name @user.user_name
  json.auth_token @user.auth_token
end