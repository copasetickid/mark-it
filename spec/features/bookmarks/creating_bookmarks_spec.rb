require "rails_helper"

RSpec.feature "Users can create new bookmarks" do
	before do
		login_as(create(:user))
		visit bookmarks_path
		click_link "New Bookmark"
	end

	scenario "with valid attributes" do
		fill_in "Title", with: "Sublime Text 3"
		fill_in "Url", with: "http://www.sublimetext.com/3"
		click_button "Create Bookmark"

		expect(page).to have_content "Bookmark has been created."
		expect(page).to have_content "Sublime Text 3"
	end

	scenario 'when providing invalid attributes' do
		click_button "Create Bookmark"

		expect(page).to have_content "Bookmark has not been created."
		expect(page).to have_content "Title can't be blank"
	end

	scenario "when adding tags" do 
		fill_in "Title", with: "Sublime Text 3"
		fill_in "Url", with: "http://www.sublimetext.com/3"
		fill_in "Tag names", with: "software, editor"
		click_button "Create Bookmark"

		expect(page).to have_content "Software"
	end
end
