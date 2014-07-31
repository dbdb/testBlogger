Given(/^I am logged in$/) do
	visit(LoginPage).login_with
end

When(/^I create new post$/) do
	on_page(HomePage).create_post
	@post_data = on_page(CreatePostPage).continue_when_loaded.populate_page
end
