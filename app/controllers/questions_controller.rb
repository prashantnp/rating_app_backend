class QuestionsController < ApplicationController
  def index
    questions = Question.all.map { |question| question.details }
    render status: 200, json: { questions: Question.all.map { |question| question.details }
  end
end
