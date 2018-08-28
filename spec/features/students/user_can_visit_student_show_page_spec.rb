require 'rails_helper'

describe 'User visits individual student show page' do
  it "should show name of student" do
    student = Student.create(name: "Ben")

    visit student_path(student)

    expect(page).to have_content(student.name)
  end
  it "shoudl show all courses student is taking" do
    student = Student.create(name: "Ben")
    course1 = student.courses.create(name: "History")
    course2 = student.courses.create(name: "Math")
    course3 = student.courses.create(name: "Art")

    visit student_path(student)

    expect(page).to have_content(course1.name)
    expect(page).to have_content(course2.name)
    expect(page).to have_content(course3.name)
  end
end
