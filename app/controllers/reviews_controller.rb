class ReviewsController < ApplicationController
  before_action :authenticate_user

  def index
    reviews = Review.all
    render json: reviews
  end

  def create
    review = Review.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      title: params[:title],
      image_url: params[:image_url],
      body: params[:body],
      star_rating: params[:star_rating],
    )
    if review.save
      render json: { message: "Review created successfully" }, status: :created
    else
      render json: { errors: review.errors.full_messages }, status: :bad_request
    end
  end

  def show
    review = Review.find_by(id: params[:id])
    render json: review
  end

  def update
    user = User.find_by(id: params[:id])
    if user == current_user
      review = Review.find_by(id: params[:id])
      review.product_id = params[:product_id] || review.product_id
      review.title = params[:title] || review.title
      review.image_url = params[:image_url] || review.image_url
      review.body = params[:body] || review.body
      review.star_rating = params[:star_rating] || review.star_rating
      review.save
      render json: review
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    review = Review.find_by(id: params[:id])
    review.destroy
    render json: { message: "Your review has been deleted." }
  end
end
