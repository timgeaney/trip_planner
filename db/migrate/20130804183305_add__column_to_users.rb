class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :gender, :string
    add_column :users, :newsletter, :boolean
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
  end
end
