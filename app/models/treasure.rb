class Treasure < ApplicationRecord
  belongs_to :warehouse
  belongs_to :status

  validates :name, presence: true

  after_create :set_treasures_count
  after_destroy :set_treasures_count

  scope :menu, -> { order(created_at: :desc).first(10) }

  has_attached_file(
    :photo,
    styles: { medium: '300x300#', thumb: '40x40#' },
    default_url: '/images/:style/missing.png'
  )

  process_in_background :photo

  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\z}

  has_paper_trail

  def self.filtered_records(q)
    if q.present?
      Treasure
        .includes(:warehouse, :status)
        .where('name ILIKE ? OR description ILIKE ?', "%#{q}%", "%#{q}%")
    else
      Treasure.includes(:warehouse, :status).all
    end
  end

  def set_treasures_count
    Rails.cache.write('treasure_count', Treasure.count)
    Rails.cache.write('menu_treasures', Treasure.menu)
  end
end
