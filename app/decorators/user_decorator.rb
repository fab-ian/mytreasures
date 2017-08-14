class UserDecorator < Draper::Decorator
  delegate_all

  def member_since
    "Member since #{I18n.l object.created_at, format: :month_and_year}"
  end
end
