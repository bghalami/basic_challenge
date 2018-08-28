class AddressesController < ApplicationController

  def new
    @address = Address.new
    @student = Student.find(params[:student_id])
  end

  def create
    student = Student.find(params[:student_id])
    student.addresses.create!(address_params)
    redirect_to student_path(student)
  end

  private

  def address_params
    params.require(:address).permit(:description,
                                    :city,
                                    :street,
                                    :zip_code,
                                    :state,
                                    :student_id
                                  )
  end
end
