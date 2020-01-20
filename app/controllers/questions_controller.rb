class QuestionsController < ApplicationController
  def index
    render status: 200, json: { success: true, questions: Question.all.map {|question| question.details} }
  end

  def show
    question = Question.find_by(id: params[:id])
    render status: 200, json: { question: question.details }
  end

  def destroy
    question = Question.find_by(id: params[:id].to_i)
    question.destroy if question
    render status: 200, json: { success: true, questions: Question.all.map {|question| question.details} }
  end

  def create
    Question.create({
      priority: params[:question]['priority'],
      question: params[:question]['question'],
      teaming_stage: params[:question]['teamingStage'],
      appears_day: params[:question]['appearsDay'],
      frequency: params[:question]['frequency'],
      question_type: params[:question]['questionType'],
      required: params[:question]['required'],
      conditions: params[:question]['conditions'],
      role: Role.find_or_create_by(name: params[:question][:role]),
      mapping: Mapping.find_or_create_by(name: params[:question][:mapping])
    })

    render status: 200, json: { success: true }
  end

  def update
    question = Question.find_by(id: params[:id].to_i)

    question.update({
      priority: params[:question]['priority'],
      question: params[:question]['question'],
      teaming_stage: params[:question]['teamingStage'],
      appears_day: params[:question]['appearsDay'],
      frequency: params[:question]['frequency'],
      question_type: params[:question]['questionType'],
      required: params[:question]['required'],
      conditions: params[:question]['conditions'],
      role: Role.find_or_create_by(name: params[:question][:role]),
      mapping: Mapping.find_or_create_by(name: params[:question][:mapping])
    })

    render status: 200, json: { success: true }
  end
end
