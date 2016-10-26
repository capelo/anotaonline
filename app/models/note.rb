require 'securerandom'

class Note < ApplicationRecord
	extend FriendlyId
	
	friendly_id :name, use: :slugged

	validates :name, presence: true
	validates :name, uniqueness: true


	def self.random_note
		
		while 1
			random_name = SecureRandom.hex
			
			if Note.find_by_name(random_name) == nil
				return Note.new(:name => random_name)
			end
		end
	end
end
