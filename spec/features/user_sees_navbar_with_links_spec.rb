require 'rails_helper'

describe "User vists any page" do
  it "should show navbar with All Students link" do
    visit students_path

    expect(page).to have_link("All Students")
  end
  it "should show navbar with Create New Student link" do
    visit students_path

    expect(page).to have_link("Create New Student")
  end
end
