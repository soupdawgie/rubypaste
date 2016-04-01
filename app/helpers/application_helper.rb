module ApplicationHelper

	def full_title(page_title = '')
		base_title = "Rubypaste"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def snippet_url(object)
		root_url + object.token
	end
end
