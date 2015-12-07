class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    render "index.json.jbuilder", status: :accepted
  end

  def show
    @movie = Movie.find(params[:id])
    render "show.json.jbuilder", status: :accepted
  end

  def create
    case movie_params[:type]
      when 'title'
        movie_hash = OMDB.title(movie_params[:title])           #Movie by title only
      when 'title-year'
        movie_hash = OMDB.title(movie_params[:title], year: movie_params[:year])   # movie by title and year
      when 'id'
        movie_hash = OMDB.id(movie_params[:imdb_id])
      else
        movie_hash = { response: false, error: "No such search type - #{movie_params[:type]}" }
    end


    if movie_hash[:response]
      @movie = Movie.find_by(imdb_id: movie_hash[:imdb_id])
      @movie = Movie.new(movie_hash.except(:response, :metascore, :imdb_votes, :runtime)) unless @movie
      if @movie.save
        render "create.json.jbuilder"               # Render errors
      else
        render json: { errors: @movie.errors.full_messages},
               status: :unprocessable_entity
      end
    else
       render json: { error: movie_hash[:error] },
              status: :unprocessable_entity
    end

  end

  # def update
  #   @movie = Movie.find(params[:id])
  #   if @movie.update_attributes(update_params)
  #     render "show.json.jbuilder", status: :accepted
  #   else
  #     render json: { error: "Unable to edit."},
  #     status: :unauthorized
  #   end
  # end
  #
  # def destroy
  #   Movie.destroy(params[:id])
  #   render json: {success: "Movie Deleted Successfully"}
  # else
  #   render json: { error: "Unable to delte movie." },
  #          status: :unauthorized
  # end

  private


  def movie_params
    params.permit(:type, :title, :year, :imdb_id)
  end

  # def update_params
  #   params.require(:movie).permit(:title, :year, :rated,
  #                                 :released, :runtime, :genre, :director, :writer,
  #                                 :actors, :plot, :language, :country, :awards,
  #                                 :poster, :imdb_rating, :imdb_id, :type)
  # end

end

# def edit
#   @movie = Movie.find(params[:id])
# end


# def movie_params
#   params.require(:movie).permit(:type, :title, :year, :imdb_id)
# end