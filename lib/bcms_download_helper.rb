# Methods added to this helper will be available to all templates in the application.
module BcmsDownloadHelper

	def download_button(content_type)
		if defined?(Object.const_get(content_type.name).downloadable) && Object.const_get(content_type.name).downloadable == true
			 link_to span_tag("download all"), '/cms/download/'+content_type.name.underscore, 
			  :id => "download_all", 
			  :class => "spacer button#{ ' off' if action_name == 'download'}"
		end
	end
	
end
