class AddNameAndAvatarToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_attachment :users, :avatar
  end
end
