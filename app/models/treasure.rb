class Treasure < ApplicationRecord
  belongs_to :warehouse
  belongs_to :status

  validates :name, presence: true

  has_attached_file(
    :photo,
    styles: { medium: '300x300', thumb: '100x100>' },
    default_url: '/images/:style/missing.png'
  )

  process_in_background :photo

  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\z}
end
