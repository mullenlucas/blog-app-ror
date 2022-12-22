class AddDefaultProfilePhoto < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :photo, from: nil, to: 'https://picsum.photos/260')
  end
end
