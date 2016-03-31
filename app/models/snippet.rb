class Snippet < ActiveRecord::Base
	validates :code, presence: true
	default_scope -> { order(created_at: :desc) }

	def title
		read_attribute(:title).presence || created_at.strftime("%d %B %Y, %H:%M")
	end

end
