class EditLayoutPage
  include PageObject
  include DataMagic

  TITLE = 'Layout'
  EDIT_HEADER_POPUP_TITLE = 'Configure Header'

  in_iframe(:id => 'editorframe') do |frame|
    link(:edit_header, :href => /Header/, :frame => frame)

    div(:blog_archive, :id => 'BlogArchive1', :frame => frame)
    div(:blog_posts, :id => 'Blog1', :frame => frame)
    div(:main_section, :id => 'main', :frame => frame)
  end

  button(:clear, :text=> 'Clear')
  div(:saving_message, :class => 'popupContent')

  # blog_header field and save_popup button are inside 'Configure Header' popup
  # possibly page objects should be created for every popup window
  text_field(:blog_header, :name => 'title')
  link(:save_popup, :id => 'save-button')

  def popup_edit_header_window
    edit_header
    attach_to_window(:title => EDIT_HEADER_POPUP_TITLE)
  end

  def populate_page
    populate_page_with data_for(:edit_layout_page)
  end

  def save_and_close_popup
    # closing a window that you are attached to can cause an error
    # save_popup
    # attach_to_window(:title => TITLE)

    attach_to_window(:title => TITLE)
    attach_to_window(:title => EDIT_HEADER_POPUP_TITLE){save_popup}

    saving_message_element.when_present
    saving_message_element.when_not_present
  end

  def drag_and_drop(what, where)
    # blog_archive_element.element returns Watir element to call Watir method drag_and_drop_on,
    # as PageObject has no its own implementation of drag and drop
    get_widget(what).element.drag_and_drop_on get_widget(where).element
  end

  def reset_layout
    clear
  end

  private

  def get_widget widget_name
    # "Blog Archive" -> blog_archive_element
    eval(widget_name.downcase.gsub(' ', '_') + '_element')
  end

end