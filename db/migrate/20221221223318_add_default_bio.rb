class AddDefaultBio < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :bio, from: nil, to: 'Rubycal User')
  end
end
