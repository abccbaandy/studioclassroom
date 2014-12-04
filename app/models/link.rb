class Link < ActiveRecord::Base
	validates_uniqueness_of :url
	def self.check
    	Link.destroy_all
  	end
end
