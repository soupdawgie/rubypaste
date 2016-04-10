module ApplicationHelper

	def full_title(page_title = '')
		base_title = "Rubypaste"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def glyph(name, text="")
		"<i class='glyphicon glyphicon-#{name}'></i>#{" " + text}".html_safe
	end

end
