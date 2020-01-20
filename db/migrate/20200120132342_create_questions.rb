class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :priority
      t.string :question
      t.string :teaming_stage
      t.string :appears_day
      t.integer :frequency
      t.string :question_type
      t.string :required
      t.string :conditions
      t.references :role
      t.references :mapping

      t.timestamps
    end
  end
end
