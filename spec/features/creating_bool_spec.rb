require 'rails_helper'

RSpec.feature "Creating Books" do
  scenario "A user creates a new book" do
    visit "/"

    # click_link "New Book"
    # fill_in "Title", with: "Creating a blog"
    # fill_in "Body", with: "Lorem Ipsum"
    # click_button "Create Article"
    
    expect(page).to have_content("BBteka")
    expect(page.current_path).to eq("/")
  end
end
