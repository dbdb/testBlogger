class LoginPage
	include PageObject
	
	page_url FigNewton.base_url 
	
	text_field(:username, :id => "Email")
	text_field(:password, :id => "Passwd")
	button(:login, :id => "signIn") 
	
	def login_with(username = FigNewton.admin.username, 
				password = FigNewton.admin.password)
				
		self.username = username
		self.password = password
		login
	end
end
