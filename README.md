### REGISTRATION ROUTES

#### To Create a User
#### POST `"/signup"`
###### Params: `user_name:` user's selected display name. `email:` a user's email address. `password:` a user has a password.

####### JSON:
```json
 {
   "user": {
     "id": 1,
     "email": "america@usa.com",
     "user_name": "Murica1",
     "auth_token": "026dd9a8da91a044d46951c5df8ebeed"
   }
 }
```


#### To Login with a User
#### POST `"/login"`
###### Params: `email:` a user's email. `password:` a user's password.

####### JSON:
```json
 {
 "user": {
   "email": "america@usa.com",
   "auth_token": "026dd9a8da91a044d46951c5df8ebeed"
 }
}
```

#### To Delete a User
#### DELETE `"/signup"`
###### Params: `email:` a user's email. `password:` a user's password.
