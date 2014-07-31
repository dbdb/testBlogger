And(/^I am on the Edit Layout page$/) do
  on(HomePage).use_menu_to_navigate_to "Layout"
end

When(/^I edit blog header$/) do
  on_page(EditLayoutPage) do |page|
    page.popup_edit_header_window
    @data = page.populate_page
    page.save_and_close_popup
  end
end

And(/^I go to my blog page$/) do
  visit BlogPage
end

Then(/^blog header should be updated$/) do
  on_page(BlogPage) do |page|
    expect(page.title).to eq(@data["blog_header"])
  end
end

When(/^I drag and drop "([^"]*)" widget to "([^"]*)" widget$/) do |what, where|
  on(EditLayoutPage).drag_and_drop(what, where)
end

Then(/^Main section of layout should include text "([^"]*)"$/) do |text|
  on_page(EditLayoutPage) do |page|
    expect(page.main_section).to include(text)
  end
end

# teardown hooks
After('@reset_layout') do
  on(EditLayoutPage).reset_layout
end