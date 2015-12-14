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
 {
 "user": {
   "email": "america@usa.com",
   "auth_token": "026dd9a8da91a044d46951c5df8ebeed"
 }
}
}
```

#### To Delete a User
#### DELETE `"/signup"`
###### Params: `email:` a user's email. `password:` a user's password.

### MOVIES ROUTES

#### To Create a Movie
#### POST `"/movies"`
###### Params: `type:` this can either be title or title and year.`title:` this is the title of the film we are searching for.Also in the headers you need to give the `auth_token:`this is your authentication token.

####### JSON:
```json
    {
    "movie":{
    "title":"Return of the Jedi","year":1983,"rated":"N/A","released":"25 May 1983",
    "genre":"Action, Adventure, Sci-Fi","director":"N/A","writer":"N/A","actor":"N/A",
    "plot":"With the rise of the empire shaking the galaxy at its core, the rebels are driven deep into hiding.
    The rebels risk all with one last strike. Is it redemption for the freedom of the galaxy ...",
    "language":"English","country":"USA","awards":"N/A","poster":"N/A","imdb_rating":"8.2","imdb_id":"tt2301123",
    "metascore":null,"imdbvotes":null,"type":"game","id":2
    }
   }
```

#### To Show a Movie
#### GET `"/movies/:id"`
###### Params: in the url after /movies/1 <-- Specify the movie_id you are looking for,this should return office space.

####### JSON:
```json
{
    {
    "movie":
    {"title":"Office Space","year":1999,"rated":"R","released":"19 Feb 1999","genre":"Comedy",
    "director":"Mike Judge","writer":"Mike Judge (Milton animated shorts), Mike Judge (screenplay)",
    "actor":"Ron Livingston, Jennifer Aniston, David Herman, Ajay Naidu",
    "plot":"Three company workers who hate their jobs decide to rebel against their greedy boss.",
    "language":"English","country":"USA","awards":"2 nominations.",
    "poster":"http://ia.media-imdb.com/images/M/MV5BOTA5MzQ3MzI1NV5BMl5BanBnXkFtZTgwNTcxNTYxMTE@._V1_SX300.jpg",
    "imdb_rating":"7.8","imdb_id":"tt0151804","metascore":null,"imdbvotes":null,"type":"movie","id":1}}
    }
```

#### To Index Movies
#### GET `"/movies"`
######  Params: there are no params the /movies returns all of the available movies stored in our database.

### REVIEW ROUTES

#### To Create a Review
#### POST `"/reviews"`
###### Params: `movie_id:` this is the id of the film.  `body:` this is the content of the review.

####### JSON:
```json
    {
    {
      "user": {
        "body": "This movie is the definition of all the things!",
        "user_id": 22,
        "movie_id": 1
      }
    }
    }
```
#### To Show a Review
#### GET `"/reviews/:id"`
###### Params: in the url after /reviews/1 <--- your specified review number there.

####### JSON:
```json
{
    {
      "review": {
        "body": "yes!",
        "movie_id": 1
      }
    }
}
```

#### To Index a User's Reviews
#### GET`"/reviews"`
###### Params: You have to pass your account's auth_token in the headers, auth_token: 9837839424873427834

####### JSON:
```json
{
    {"review":[{"body":"This movie is the definition of all the things!",
    "movie_id":1,"user_id":22},{"body":"This movie is the definition of all the things!",
    "movie_id":1,"user_id":22},{"body":"This movie is the definition of all the things!",
    "movie_id":1,"user_id":22}]}
}
```