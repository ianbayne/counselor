class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :content
      t.references :user_profile, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
