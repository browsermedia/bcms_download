#Content Type Download Feature for BrowserCMS

This plugin adds the ability for any content type to be downloaded as a CSV file through the CMS.

## Installation

The Download module installs like most other BrowserCMS modules.

    gem install bcms_download

## Set up your application to use the module

### 1. Edit config/environment.rb

    config.gem "bcms_download"

### 2. Run the following commands

    script/generate browser_cms

### 3. Edit config/routes.rb

Make sure the routes.rb loads the download routes.

    map.routes_for_bcms_download


##Configuration

The download link will show up within the "Content Library" when a "Content Type" is selected.

You can have any Content Type model be downloadable.  To do so, simply add:

	self.downloadable; true end
	
To the model.

By default, the CSV file will use all column names, to specify only the columns you want,
add an additional attribute:

	self.columns_for_download
		%w(column1 column2 column3 column4) # etc...
	end
	
Only those columns you have specified will be used in the download. A full example implementation would be:

	class Entry < ActiveRecord::Base
	  acts_as_content_block

		def self.downloadable; true end
	
		def self.columns_for_download
			%w(id name email city state zipcode)
		end
	end




