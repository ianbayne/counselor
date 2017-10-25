class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :payed_user, :boolean, null: false, default: false
    add_reference :users, :counsellor, foreign_key: true
  end
end
