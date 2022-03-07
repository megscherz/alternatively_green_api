class ProductsController < ApplicationController
  # before_action :authenticate_user, except: [:index, :show]

  def index
    products = Product.all
    render json: products
  end

  def create
    product = Product.new(
      name: params[:name],
      description: params[:description],
      category: params[:category],
      image_url: params[:image_url],
      price: params[:price],
      ingredients: params[:ingredients],
    )
    if product.save
      render json: { message: "Product created successfully" }, status: :created
    else
      render json: { errors: product.errors.full_messages }, status: :bad_request
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product successfully deleted" }
  end
end
