class Snippet < ActiveRecord::Base
	validates :code, presence: true
	default_scope -> { order(created_at: :desc) }
	
end
