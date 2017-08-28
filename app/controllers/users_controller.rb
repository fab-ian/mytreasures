class UsersController < ApplicationController
  authorize_resource

  expose :users, -> { User.order(created_at: :desc) }
  expose :user

  def create
    if user.save
      redirect_to users_path, notice: I18n.t('user_notice.add')
    else
      render :new
    end
  end

  def update
    if user.update(user_params)
      redirect_to users_path, notice: I18n.t('user_notice.update')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :password, :email, :locale, roles: [])
  end
end
