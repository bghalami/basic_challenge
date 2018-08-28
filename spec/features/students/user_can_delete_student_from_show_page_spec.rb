require "rails_helper"

describe "User can delete student from index page" do
  it "should redirect to index page W/O deleted students name" do
    student1 = Student.create(name: "Cornman")
    student2 = Student.create(name: "Sclornman")
    visit students_path

    expect(page).to have_content("Cornman")
    expect(page).to have_content("Sclornman")

    within(".student-#{student1.id}") do
      click_on("Delete")
    end 

    expect(current_path).to eq(students_path)
    expect(page).to have_content("Sclornman")
    expect(page).to_not have_content("Cornman")
  end
end
