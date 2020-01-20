# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach(Rails.root.join('db', 'data', 'csv_data.csv'), headers: true) do |row|
  row_hash = row.to_hash

  mapping = Mapping.find_or_create_by(name: row_hash['Mapping'])
  role = Role.find_or_create_by(name: row_hash['Role'])

  question = Question.find_or_create_by(
    priority: row_hash['Pri'],
    question: row_hash['Question'],
    teaming_stage: row_hash['Teaming Stages'],
    appears_day: row_hash['Appears (Day)'],
    frequency: row_hash['Frequency'],
    question_type: row_hash['Type'],
    required: row_hash['Required?'],
    conditions: row_hash['Conditions'],
    role: role,
    mapping: mapping
  )
end