class Treasure < ApplicationRecord
  belongs_to :warehouse

  validates :name, presence: true

  after_create :set_treasures_count
  after_destroy :set_treasures_count

  scope :menu, -> { order(created_at: :desc).first(10) }
  scope :get_last_warehouse, lambda { |user_id|
    # Check if current user has added at least once Treasure record.
    present =
      PaperTrail::Version
      .where(whodunnit: user_id, item_type: 'Treasure', event: 'create')
      .present?

    if present
      pt_rec =
        PaperTrail::Version
        .where(whodunnit: user_id, item_type: 'Treasure', event: 'create')
        .last

      pt_rec_count =
        PaperTrail::Version
        .where(whodunnit: user_id, item_type: 'Treasure', item_id: pt_rec.item_id)
        .count

      # if record was only 'created' not updated or destroyed
      if pt_rec_count == 1
        Treasure.find(pt_rec.item_id).warehouse_id
      else
        PaperTrail::Version
          .where(whodunnit: user_id, item_type: 'Treasure', item_id: pt_rec.item_id)
          .last.reify.warehouse_id
      end
    else
      Warehouse.first.id
    end
  }

  has_attached_file(
    :photo,
    styles: { medium: '300x300#', thumb: '40x40#', large: '1200x1200>' },
    default_url: '/images/:style/missing.png',
    only_process: %i(thumb original)
  )

  process_in_background :photo, only_process: %i[medium large]

  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\z}

  has_paper_trail

  def self.filtered_records(q)
    if q.present?
      Treasure
        .includes(:warehouse)
        .where('name ILIKE ? OR description ILIKE ?', "%#{q}%", "%#{q}%")
    else
      Treasure.includes(:warehouse).all
    end
  end

  def set_treasures_count
    Rails.cache.write('treasure_count', Treasure.count)
    Rails.cache.write('menu_treasures', Treasure.menu)
  end
end
