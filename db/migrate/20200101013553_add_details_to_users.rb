class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :num_celular, :integer
    add_column :users, :admin, :boolean , default: false
    add_column :users, :active, :boolean, default: false
  end
end
