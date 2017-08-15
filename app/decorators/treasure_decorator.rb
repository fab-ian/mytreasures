class TreasureDecorator < Draper::Decorator
  delegate_all

  def description
    object.description.present? ? h.truncate(object.description, length: 42) : '(no description)'
  end

  def name
    h.truncate(object.name, length: 18)
  end

  def created_at
    l object.created_at, format: :dmy
  end
end
