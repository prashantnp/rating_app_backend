class QuestionsController < ApplicationController
  def index
    render status: 200, json: { questions: Question.all.map {|question| question.details} }
  end

  def destroy
    question = Question.find_by(id: params[:id].to_i)
    question.destroy if question
    render status: 200, json: { questions: Question.all.map {|question| question.details} }
  end
end
