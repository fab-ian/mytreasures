class Warehouse < ApplicationRecord
  has_many :treasures
  validates :name, presence: true

end
