class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @addresses = @student.addresses
  end

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.create(student_params)
    redirect_to student_path(student)
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.update(student_params)
    redirect_to student_path(student)
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy

    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end
end
