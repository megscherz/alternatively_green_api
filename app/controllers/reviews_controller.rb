class ReviewsController < ApplicationController
  before_action :authenticate_user

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
      render json: review
    else
      render json: { errors: review.errors.full_messages }, status: :bad_request
    end
  end

  def update
    review = Review.find_by(id: params[:id])
    review.product_id = params[:product_id] || review.product_id
    review.title = params[:title] || review.title
    review.image_url = params[:image_url] || review.image_url
    review.body = params[:body] || review.body
    review.star_rating = params[:star_rating] || review.star_rating
    if review.save
      render json: review
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    review = Review.find_by(id: params[:id])
    if review.destroy
      render json: { message: "Your review has been deleted." }
    else
      render json: {}, status: :unauthorized
    end
  end
end
