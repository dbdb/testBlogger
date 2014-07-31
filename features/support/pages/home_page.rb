class HomePage
	include PageObject
	
	page_url FigNewton.base_url 
	
	expected_title /Blogger Dashboard/
	expected_element :create_post
	
	link(:create_post, :href => /editor/)

  button(:expand_navigation_menu, :class => /blogg-collapse-left/)
  div(:navigation_menu, :class=> "blogg-menu-popup")

  def use_menu_to_navigate_to menu_item
    expand_navigation_menu
    navigation_menu_element.div_element(:text => menu_item).click
  end

end