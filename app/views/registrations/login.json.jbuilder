json.user do
  json.extract! @user, :email, :auth_token, :id, :user_name
end