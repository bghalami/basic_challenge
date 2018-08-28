require "rails_helper"

describe "User visits new address for one student page" do
  it "should have a form to create new address" do
    student = Student.create(name: "James Jones")

    visit new_student_address_path(student)

    expect(page).to have_field("Street")
    expect(page).to have_field("City")
    expect(page).to have_field("State")
    expect(page).to have_field("Zip code")
    expect(page).to have_button("Create Address")
  end
  it "should take me to students show page and display address" do
    student = Student.create(name: "James Jones")

    visit new_student_address_path(student)

    fill_in("Description", with: "Home Zone")
    fill_in("Street", with: "1406 Blane Lane")
    fill_in("City", with: "Kanesville")
    fill_in("State", with: "Solid")
    fill_in("Zip code", with: "11001")
    click_on("Create Address")

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content("Description: Home Zone")
    expect(page).to have_content("Street: 1406 Blane Lane")
    expect(page).to have_content("City: Kanesville")
    expect(page).to have_content("State: Solid")
    expect(page).to have_content("Zip Code: 11001")
  end
  it "should show ALL addresses" do
    student = Student.create(name: "James Jones")

    visit new_student_address_path(student)

    fill_in("Description", with: "Home Zone")
    fill_in("Street", with: "1406 Blane Lane")
    fill_in("City", with: "Kanesville")
    fill_in("State", with: "Solid")
    fill_in("Zip code", with: "11001")
    click_on("Create Address")

    visit new_student_address_path(student)

    fill_in("Description", with: "Home Zone2")
    fill_in("Street", with: "1406 Blane Lane2")
    fill_in("City", with: "Kanesville2")
    fill_in("State", with: "Solid2")
    fill_in("Zip code", with: "110012")
    click_on("Create Address")

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content("Description: Home Zone")
    expect(page).to have_content("Street: 1406 Blane Lane")
    expect(page).to have_content("City: Kanesville")
    expect(page).to have_content("State: Solid")
    expect(page).to have_content("Zip Code: 11001")
    expect(page).to have_content("Description: Home Zone2")
    expect(page).to have_content("Street: 1406 Blane Lane2")
    expect(page).to have_content("City: Kanesville2")
    expect(page).to have_content("State: Solid2")
    expect(page).to have_content("Zip Code: 110012")
  end
end
