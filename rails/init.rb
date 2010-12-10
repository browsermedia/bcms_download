require 'browsercms'
gem_root = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Cms.add_to_rails_paths gem_root
Cms.add_generator_paths gem_root, "app/views/cms/blocks/_toolbar_for_collection.html.erb"
ActionView::Base.send :include, BcmsDownloadHelper