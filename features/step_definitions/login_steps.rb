Given(/^I am on the Login page$/) do
	visit LoginPage
end

When(/^I login as a blog admin$/) do
	on_page(LoginPage).login_with
end

Then(/^Home page should be opened$/) do
	on_page(HomePage) do |page|
		expect(page).to have_expected_title
		expect(page).to have_expected_element
	end
end