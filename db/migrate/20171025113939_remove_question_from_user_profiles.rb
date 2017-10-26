class RemoveQuestionFromUserProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :user_profiles, :questions
    remove_reference :user_profiles, :question, index: true
  end
end
