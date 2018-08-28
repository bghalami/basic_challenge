require 'rails_helper'

describe 'User visits specific course page' do
  it "should display only the student in that class" do
    course1 = Course.create!(name: "Math")
    course2 = Course.create!(name: "Art")
    course3 = Course.create!(name: "Spanish")
    student1 = course1.students.create!(name: "Ben")
    student2 = course1.students.create!(name: "Jen")
    student3 = course1.students.create!(name: "Len")
    student4 = course2.students.create!(name: "Nick")
    student5 = course2.students.create!(name: "Rick")
    student6 = course2.students.create!(name: "Plick")
    student7 = course3.students.create!(name: "Amy")
    student8 = course3.students.create!(name: "Raimy")

    visit course_path(course1)
    expect(page).to have_content(student1.name)
    expect(page).to have_content(student2.name)
    expect(page).to have_content(student3.name)
    expect(page).to_not have_content(student4.name)
    expect(page).to_not have_content(student5.name)
    expect(page).to_not have_content(student6.name)
    expect(page).to_not have_content(student7.name)
    expect(page).to_not have_content(student8.name)

    visit course_path(course2)
    expect(page).to_not have_content(student1.name)
    expect(page).to_not have_content(student2.name)
    expect(page).to_not have_content(student3.name)
    expect(page).to have_content(student4.name)
    expect(page).to have_content(student5.name)
    expect(page).to have_content(student6.name)
    expect(page).to_not have_content(student7.name)
    expect(page).to_not have_content(student8.name)

    visit course_path(course3)
    expect(page).to_not have_content(student1.name)
    expect(page).to_not have_content(student2.name)
    expect(page).to_not have_content(student3.name)
    expect(page).to_not have_content(student4.name)
    expect(page).to_not have_content(student5.name)
    expect(page).to_not have_content(student6.name)
    expect(page).to have_content(student7.name)
    expect(page).to have_content(student8.name)
  end
end
