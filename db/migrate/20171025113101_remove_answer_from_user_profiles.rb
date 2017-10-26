class RemoveAnswerFromUserProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_profiles, :answer, :integer
  end
end
