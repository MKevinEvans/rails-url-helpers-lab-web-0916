class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    if @student.active
      @activity = "active"
    else @activity = "inactive"
    end
  end

  def activate_student
    @student = Student.find(params[:id])
    if @student.active
      @student.active = false
    else @student.active = true
    end
    @student.save
    redirect_to student_path
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end