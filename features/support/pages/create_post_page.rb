class CreatePostPage
	include PageObject
	include DataMagic
	
	text_field(:post_title, :class=> /titleField textField/)
	element(:editor_frame, :iframe, :id => "postingComposeBox")
	
	# it should be clicked to show textarea for labels
	span(:add_labels, :text => "Labels")
	textarea(:labels, :class => "GCUXF0KCEWB")
	
	button(:close, :text => "Close")
	button(:save, :text => "Save")
	
	# after Save was clicked it changes to Saving... for a moment
	button(:saving, :text => "Saving...")
	
	def continue_when_loaded
		wait_until do
			post_title_element.exists? and add_labels_element.exists? and editor_frame_element.exists?
		end
		
		self
	end
	
	def post_body= (t)
		editor_frame_element.send_keys t
	end
	
	def post_labels= (l)
		add_labels_element.click
		self.labels = l
	end
	
	def populate_page
		data = data_for(:create_post_page)
		
		# can't use populate_page_with here as it works only with checkbox, radio and text fields
		self.post_title = data["post_title"]
		self.post_body = data["post_body"]
		self.post_labels = data["post_labels"]
		
		save
		saving_element.when_not_present
		data
	end
end
