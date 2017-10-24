class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :counsellor, foreign_key: true

      t.timestamps
    end
  end
end
