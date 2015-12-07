class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    # movie = Movie.find(params[:movie_id])
    @review = Review.create(body: params[:body])
    if @review.save
      render "create.json.jbuilder", status: :created

    else
      render json: { errors: @review.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    @review = Review.find(params[:id])
      render "show.json.jbuilder", status: :ok
  end

  def index
    @reviews = current_user.reviews
    render "index.json.jbuilder", status: :ok

  end

  def update
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
       @review.update(body: params[:body])
      render "update.json.jbuilder", status: :accepted
    else
      render json: { error: "You do not have permission to update this review." },
             status: :unauthorized
    end
  end

  def destroy
    review = Review.find(params[:id])
    if review.user_id == current_user.id
      review.destroy
      render plain: "This review has been deleted."
    else
      render json: { error: "You do not have permission to delete this review." },
             status: :unauthorized
    end
  end
end

