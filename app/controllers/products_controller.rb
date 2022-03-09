class ProductsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

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

  def update
    user = User.find_by(id: params[:id])
    if user == current_user
      product = product.find_by(id: params[:id])
      product.name = params[:name] || product.name
      product.description = params[:description] || product.description
      product.category = params[:category] || product.category
      product.image_url = params[:image_url] || product.image_url
      product.price = params[:price] || product.price
      product.ingredients = params[:ingredients] || product.ingredients
      product.save
      render json: product
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product successfully deleted." }
  end
end
