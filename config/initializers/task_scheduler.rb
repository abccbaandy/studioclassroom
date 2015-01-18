require 'rufus/scheduler'
require 'open-uri'

scheduler = Rufus::Scheduler.new

scheduler.every '6h' do
	@doc = Nokogiri::HTML(open("http://w2.goodtv.tv/studio_classroom/"))
	video = @doc.at_css("video")
	if video.nil?
		puts "video not found"
	else
		url = @doc.at_css("video")[:src]
		link = Link.new(:url=>url)
		puts link.save
	end
end