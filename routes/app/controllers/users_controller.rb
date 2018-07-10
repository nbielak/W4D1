class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user, status: 201
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def delete
    user = User.find_by(id: params[:id])
    user.destroy
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
