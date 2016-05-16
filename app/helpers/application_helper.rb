module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Rubypaste"
    return base_title if page_title.empty?
    page_title + " | " + base_title
  end

  def glyph(name, text="")
    "<i class='glyphicon glyphicon-#{name}'></i>#{" " + text}".html_safe
  end
end
