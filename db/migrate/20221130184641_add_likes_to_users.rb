class AddLikesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :user, :likes, :string
    add_index :user, :likes
  end
end
