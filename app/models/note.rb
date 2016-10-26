require 'securerandom'

class Note < ApplicationRecord
	extend FriendlyId
	
	friendly_id :name, use: :slugged

	validates :name, presence: true
	validates :name, uniqueness: true


	def self.random_note
		random_name = SecureRandom.hex
		while (Note.find_by_name(random_name) != nil)
			random_name = SecureRandom.hex
		end

		return Note.new(:name => random_name)
	end
end
