class ReviewsController < ApplicationController
  before_action :authenticate_user

  def create
    review = Review.new(
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

  def destroy
    review = Review.find_by(id: params[:id])
    review.destroy
    render json: review
  end
end
