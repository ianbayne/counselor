class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.boolean :active

      t.timestamps
    end
  end
end
