class AddIntroductionToCounsellor < ActiveRecord::Migration[5.1]
  def change
    add_column :counsellors, :introduction, :text
  end
end
