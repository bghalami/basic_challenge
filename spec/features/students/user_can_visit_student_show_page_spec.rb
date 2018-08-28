require 'rails_helper'

describe 'User visits individual student show page' do
  it "should show name of student" do
    student = Student.create(name: "Ben")

    visit student_path(student)

    expect(page).to have_content(student.name)
  end
end
