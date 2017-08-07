class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  before_action :set_treasures_info

  def set_treasures_info
    Rails.cache.write('treasure_count', Treasure.count) if Rails.cache.fetch('treasure_count').nil?
    @treasure_count = Rails.cache.fetch('treasure_count')

    if Rails.cache.fetch('menu_treasures').nil?
      Rails.cache.write('menu_treasures', Treasure.menu)
    end

    @menu_treasures = Rails.cache.fetch('menu_treasures')
  end
end
