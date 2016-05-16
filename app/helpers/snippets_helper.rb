module SnippetsHelper

  def count_code(obj)
    obj.code.squish.length - obj.code.squish.count(" ")
  end

  def count_lines(obj)
    obj.code.lines.count
  end

  def count_time(obj)
    time_ago_in_words(obj.created_at)
  end

  def visibility(obj)
    obj.public? ? str = "public" : str = "private"
    "<li class=\"#{str}\">#{str.capitalize}</li>"
  end
end
