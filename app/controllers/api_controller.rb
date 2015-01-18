require 'open-uri'

class ApiController < ApplicationController
	def check
		@doc = Nokogiri::HTML(open("http://w2.goodtv.tv/studio_classroom/"))
		video = @doc.at_css("video")
		if video.nil?
			render :json => {:url => "" , :errors => "video not found"}
			return
		end
		url = @doc.at_css("video")[:src]
		link = Link.new(:url=>url)
		if link.save
			render :json => {:url => url }
		else
			render :json => {:url => url, :errors => link.errors }
		end
		
	end
	def links
		links = Link.all
		render :json => {:links => links}
	end
end
