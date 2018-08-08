class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :avatar, :string
    add_column :users, :admin, :boolean, default: false
  end
  add_index :users, :email, unique: true
end

