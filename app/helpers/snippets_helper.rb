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
end
