class QuestionsController < ApplicationController
  def index
    render status: 200, json: { questions: Question.all.map {|question| question.details} }
  end
end
