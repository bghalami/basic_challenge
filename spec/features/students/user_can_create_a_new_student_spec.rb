require 'rails_helper'

describe 'User visits create student page' do
  it "should show form for new student" do
    visit new_student_path

    expect(page).to have_button("Create Student")
    expect(page).to have_field("Name")
  end
  it 'should create a new student' do
    visit new_student_path

    fill_in('Name', with: "Jen")
    click_on("Create Student")

    expect(current_path).to eq(student_path(Student.last))
    expect(page).to have_content("Jen")
  end
end
