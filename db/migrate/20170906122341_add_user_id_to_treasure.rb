class AddUserIdToTreasure < ActiveRecord::Migration[5.1]
  def change
    add_reference :treasures, :user, foreign_key: true
  end
end
