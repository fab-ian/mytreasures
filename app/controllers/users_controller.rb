class UsersController < ApplicationController
  expose :users, -> { User.order(created_at: :desc) }
  expose :user

  def create
    if user.save
      redirect_to users_path, notice: 'User has been successfully created.'
    else
      render :new
    end
  end

  def destroy
    if user.destroy
      redirect_to users_path, notice: 'User has been successfully removed.'
    else
      redirect_to users_path, notice: 'User hasn\'t been removed!'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :password, :email)
  end
end
