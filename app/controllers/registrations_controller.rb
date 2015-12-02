class RegistrationsController < ApplicationController

  def create
    @user = User.new(email: params[:email],
                     user_name: params[:user_name],
                     password: params[:password],
                     )
    if @user.save
      render "create.json.jbuilder", status: :created

    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      render "login.json.jbuilder", status: :ok

    else
      render json: { error: "Could not find user for #{params[:email]} or wrong password." },
             status: :unauthorized
    end
  end

  def delete
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @user.destroy
      render json: {success: "Delete success!"}
    else
      render json: { error: "Invalid email (#{params[:email]}) or password." },
             status: :unauthorized
    end
  end

end



#     while User.exists?(auth_token: token)
#       token = SecureRandom.hex
#     end
#     token
#   end
# end


#
# class MovieController < ApplicationController
#
#   def movie_search
#     if params[:movie] == nil
#       movie = @movie_data = nil
#     else
#       movie = params[:movie]
#       @results = OMDB.search(movie)
#       @movie_data = OMDB.title(movie)
#
#       unless @movie_data.response == "False"
#         @title = @movie_data.title
#         @year = @movie_data.year
#         @poster = @movie_data.poster
#         @plot = @movie_data.plot
#         @rated = @movie_data.rated
#         @released = @movie_data.released
#         @runtime = @movie_data.runtime
#         @genre = @movie_data.genre
#         @director = @movie_data.director
#         @writer = @movie_data.writer
#         @actors = @movie_data.actors
#         @language = @movie_data.language
#         @country = @movie_data.country
#         @awards = @movie_data.awards
#         @imdb_id = @movie_data.imdb_id
#         @imdb_rating = @movie_data.imdb_rating
#         @type = @movie_data.type
#       end
#     end
#   end
# end