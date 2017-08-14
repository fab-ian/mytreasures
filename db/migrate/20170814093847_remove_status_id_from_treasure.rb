class RemoveStatusIdFromTreasure < ActiveRecord::Migration[5.1]
  def change
    remove_column :treasures, :status_id
  end
end
