require 'rails_helper'

describe 'User visits student index page' do
  it "should show name of student" do
    student1 = Student.create(name: "Ben")
    student2 = Student.create(name: "Ken")

    visit students_path

    expect(page).to have_link(student1.name)
    expect(page).to have_link(student2.name)
  end
end
