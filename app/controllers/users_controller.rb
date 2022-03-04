class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      user_name: params[:user_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_url: params[:image_url],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user == current_user
      render json: user
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user == current_user
      user.first_name = params[:first_name] || user.first_name
      user.last_name = params[:last_name] || user.last_name
      user.user_name = params[:user_name] || user.user_name
      user.email = params[:email] || user.email
      user.password = params[:password] || user.password
      user.password_confirmation = params[:password_confirmation] || user.password_confirmation
      user.image_url = params[:image_url] || user.image_url
      user.save
      render json: user
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user == current_user
      user.destroy
      render json: { message: "User successfully deleted" }
    else
      render json: {}, status: :unauthorized
    end
  end
end
