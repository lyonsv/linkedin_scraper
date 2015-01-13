class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @educations = Education.all
    respond_with(@educations)
  end

  def show
    respond_with(@education)
  end

  def new
    @education = Education.new
    respond_with(@education)
  end

  def edit
  end

  def create
    @education = Education.new(education_params)
    @education.save
    respond_with(@education)
  end

  def update
    @education.update(education_params)
    respond_with(@education)
  end

  def destroy
    @education.destroy
    respond_with(@education)
  end

  private
    def set_education
      @education = Education.find(params[:id])
    end

    def education_params
      params.require(:education).permit(:name, :description, :period, :contact_id)
    end
end
