Gem::Specification.new do |s|
  s.name = %q{bcms_download}
  s.version = "0.0.1"
  s.date = %q{2010-12-07}
  s.authors = ["Craig Hoover"]
  s.email = %q{choover@browsermedia.com}
  s.summary = %q{BCMS Download allows for any content type to be downloaded as a CSV export}
  s.homepage = %q{http://www.browsercms.org/}
  s.description = %q{BCMS Download allows for any content type to be downloaded as a CSV export}
  s.files = [ "README.markdown", "LICENSE", "rails/init.rb", "app/controllers/cms/download_controller.rb", "lib/bcms_download/routes.rb", "lib/bcms_download.rb", "lib/bcms_download_helper.rb","app/views/cms/blocks/_toolbar_for_collection.html.erb"]
	s.add_dependency(%q<browsercms>, ["~> 3.1.2"])
end