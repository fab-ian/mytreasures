class TreasureDecorator < Draper::Decorator
  delegate_all

  def description
    if object.description.present?
      h.truncate(object.description, length: 42)
    else
      I18n.t('no_description')
    end
  end

  def name
    h.truncate(object.name, length: 18)
  end

  def created_at
    l object.created_at, format: :dmy
  end
end
