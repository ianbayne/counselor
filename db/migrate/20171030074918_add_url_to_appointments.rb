class AddUrlToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :url, :text
  end
end
