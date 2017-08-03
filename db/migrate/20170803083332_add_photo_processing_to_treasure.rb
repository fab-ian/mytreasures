class AddPhotoProcessingToTreasure < ActiveRecord::Migration[5.1]
  def self.up
    add_column :treasures, :photo_processing, :boolean
  end

  def self.down
    remove_column :treasures, :photo_processing
  end
end
