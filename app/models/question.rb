class Question < ApplicationRecord
  belongs_to :role
  belongs_to :mapping

  def details
    {
      id: id,
      priority: priority,
      question: question,
      teaming_stage: teaming_stage,
      appears_day: appears_day,
      frequency: frequency,
      question_type: question_type,
      role: role.name,
      required: required,
      conditions: conditions,
      mapping: mapping.name
    }
  end
end
