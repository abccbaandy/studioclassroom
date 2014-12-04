require 'open-uri'
class ApiController < ApplicationController
	def check
		@doc = Nokogiri::HTML(open("http://w2.goodtv.tv/studio_classroom/"))
		url = @doc.at_css("video")[:src]
		link = Link.new(:url=>url)
		render :json => {:url => url, :status => link.save}
	end
end
