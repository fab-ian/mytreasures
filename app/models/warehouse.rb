class Warehouse < ApplicationRecord
  has_many :treasures
  validates :name, presence: true
  has_paper_trail
end
