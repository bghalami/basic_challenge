require 'rails_helper'

describe 'User visits edit student page' do
  it "should show form for edit student" do
    student = Student.create(name: "Pen")

    visit edit_student_path(student)

    expect(page).to have_button("Update Student")
    expect(page).to have_field("Name")
  end
  it 'should create a new student' do
    student = Student.create(name: "Pen")

    visit edit_student_path(student)

    fill_in('Name', with: "Mlen")
    click_on("Update Student")

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content("Mlen")
  end
end
