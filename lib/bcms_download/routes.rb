module Cms::Routes
  def routes_for_bcms_download
    namespace(:cms) do |cms|
      cms.download 'download/:content_type', :controller => 'download', :action => 'index'
    end  
  end
end
