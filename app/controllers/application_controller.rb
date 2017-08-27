class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  before_action :set_treasures_info
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, alert: exception.message }
    end
  end

  def set_treasures_info
    Rails.cache.write('treasure_count', Treasure.count) if Rails.cache.fetch('treasure_count').nil?
    @treasure_count = Rails.cache.fetch('treasure_count')

    if Rails.cache.fetch('menu_treasures').nil?
      Rails.cache.write('menu_treasures', Treasure.menu)
    end

    @menu_treasures = Rails.cache.fetch('menu_treasures')
  end

  def set_locale
    I18n.locale = current_user.locale || I18n.default_locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name avatar locale))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name avatar locale))
  end
end
