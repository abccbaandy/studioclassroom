require 'open-uri'
require 'rufus/scheduler'

class ApiController < ApplicationController
	def check
		@doc = Nokogiri::HTML(open("http://w2.goodtv.tv/studio_classroom/"))
		url = @doc.at_css("video")[:src]
		link = Link.new(:url=>url)
		if link.save
			render :json => {:url => url }
		else
			render :json => {:url => url, :errors => link.errors }
		end
		
	end
end
