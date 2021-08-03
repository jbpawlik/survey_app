class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
    render :index
  end

  def new
    @survey = Survey.new
    render :new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:notice] = "Survey successfully added!"
      redirect_to surveys_path
    else
      render :new
    end
  end

  def edit
    @survey = Survey.find(params[:id])
    render :edit
  end

  def show
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    render :show
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      flash[:notice] = "Survey successfully updated!"
      redirect_to surveys_path
    else
      render :edit
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Survey successfully deleted!"
    redirect_to surveys_path
  end

  def answers
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    @questions.each do |question|
      question.update({:answer => params[question.id.to_s]})
      question.save
    end
    render :answer
  end

  private
  def survey_params
    params.require(:survey).permit(:name, :topic)
  end

end