require "rails_helper"

RSpec.feature "Submit For Calculation", :type => :feature do
  scenario "User enter form for calculation " do
    visit "/"

    fill_in "calculator[input]", :with => "5*3+1+6/2+9*100"
    click_button "Calculate"

    expect(page).to have_text("919")
  end
end
