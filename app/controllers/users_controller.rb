class UsersController < ApplicationController
  def index
    # debugger
    render json: User.all
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json:user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json:user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end 
  end



end
