module ApplicationHelper

	def display_datetime(dt)
		dt.strftime("%l:%M%P %Z %m-%d-%Y")
	end

	def fix_url(url)
		url.starts_with?('http://') ? url : "http://#{url}"
	end

end
