class Treasure < ApplicationRecord
  belongs_to :warehouse
  belongs_to :status
end
