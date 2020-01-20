class ModifyAppearsDayFromQuestions < ActiveRecord::Migration[6.0]
  def up
    change_column :questions, :appears_day, :integer
  end

  def down
    change_column :questions, :appears_day, :string
  end
end
