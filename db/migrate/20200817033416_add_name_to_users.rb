class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password, :integer
    add_column :users, :first_name_kannji, :string
    add_column :users, :last_name_kannji, :string
    add_column :users, :first_name_katakana, :string
    add_column :users, :last_name_katakana, :string
    add_column :users, :birth_day, :date
  end
end
