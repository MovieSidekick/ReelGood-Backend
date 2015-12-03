class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    render "index.json.jbuilder", status: :accepted
  end

  def show
    @movie = Movie.find(params[:id])
    render "show.json.jbuilder", status: :accepted
  end


  def new
    @movie = Movie.new
  end

  def create
    case movie_params[:type]
      when 'Title only'
        movie_hash = OMDB.title(movie_params[:title])           #Movie by title only
      when 'Title and year'
        movie_hash = OMDB.title(movie_params[:title], year: movie_params[:year])   # movie by title and year
      when 'IMDB ID'
        movie_hash = OMDB.id(movie_params[:imdb_id])
      else
        movie_hash[:response] = false
    end

    @movie = Movie.new
    if movie_hash[:response]  == 'True'
      if Movie.find_by(imdb_id: movie_hash[:imdb_id])         #Check if this movie is already in our DB.
        flash[:info] = 'Movie already exists.'
        redirect_to Movie.find_by(imdb_id: movie_hash[:imdb_id])
      else
        @movie = Movie.new(movie_hash.except(:response, :metascore, :imdb_votes))   #Except for fields we don't use.
        if @movie.save
          flash[:success] = "Movie added!"
          redirect_to @movie
        else
          render 'new'                  # Render errors
        end
      end
    else
      flash.now[:error] = "Could not find movie."
      render 'new'
    end

  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(update_params)
      render "show.json.jbuilder", status: :accepted
    else
      render json: { error: "Unable to edit."},
      status: :unauthorized
    end
  end

  def destroy
    Movie.destroy(params[:id])
    render json: {success: "Movie Deleted Successfully"}
  else
    render json: { error: "Unable to delte movie." },
           status: :unauthorized
  end

  private

  def movie_params
    params.require(:movie).permit(:type, :title, :year, :imdb_id)
  end

  def update_params
    params.require(:movie).permit(:title, :year, :rated,
                                  :released, :runtime, :genre, :director, :writer,
                                  :actors, :plot, :language, :country, :awards,
                                  :poster, :imdb_rating, :imdb_id, :type)
  end

end

# def edit
#   @movie = Movie.find(params[:id])
# end