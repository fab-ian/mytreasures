class UsersController < ApplicationController
  authorize_resource

  expose :users, -> { User.order(created_at: :desc) }
  expose :user

  def create
    if user.save
      redirect_to users_path, notice: 'User has been created successfully.'
    else
      render :new
    end
  end

  def update
    if user.update(user_params)
      redirect_to users_path, notice: 'User has been updated successfully'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :password, :email, :locale, roles: [])
  end
end
