class AddPhotoToTreasure < ActiveRecord::Migration[5.1]
  def up
    add_attachment :treasures, :photo
  end

  def down
    remove_attachment :treasures, :photo
  end
end
