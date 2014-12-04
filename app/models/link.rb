class Link < ActiveRecord::Base
	def self.check
    	Link.destroy_all
  	end
end
