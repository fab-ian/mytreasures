class CreateTreasures < ActiveRecord::Migration[5.1]
  def change
    create_table :treasures do |t|
      t.references :warehouse, foreign_key: true
      t.references :status, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
