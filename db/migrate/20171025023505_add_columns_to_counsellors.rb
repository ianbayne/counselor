class AddColumnsToCounsellors < ActiveRecord::Migration[5.1]
  def change
    add_column :counsellors, :first_name, :string
    add_column :counsellors, :last_name, :string
    add_column :counsellors, :photo, :string
    add_column :counsellors, :gender, :integer
    add_column :counsellors, :age, :integer
  end
end
