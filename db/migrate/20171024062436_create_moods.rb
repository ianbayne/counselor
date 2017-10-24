class CreateMoods < ActiveRecord::Migration[5.1]
  def change
    create_table :moods do |t|
      t.integer :mood
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
