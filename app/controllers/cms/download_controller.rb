class Cms::DownloadController < ApplicationController

  require 'csv'

  def index
		if params[:content_type]
			klassname = params[:content_type]
			klass = Object.const_get(klassname.camelize)
			use_columns = []

			if !defined?(klass.downloadable) or !klass.downloadable
				flash[:error] = 'That resource is not available for download'
				redirect_to "/cms/#{klassname.pluralize}"
				return
			end
			
			if defined?(klass.columns_for_download)
				use_columns = klass.columns_for_download
			end

	    @entries = klass.find_all_by_published(true, :order => "created_at asc")

			if @entries.blank?
				render :text => 'There are no entries available'
			else
		    report = StringIO.new
		    CSV::Writer.generate(report, ',') do |title|
					columns = use_columns.blank? ? klass.column_names : use_columns
					title << columns.map{|c| c.to_s.humanize }.to_a
		      @entries.each do |pe|
						entry = Array.new
						columns.each do |col|
								entry.push(pe[col])
						end
		        title << entry
		      end
		    end
		    report.rewind
				curdatetime = Time.new.to_i.to_s
		     send_data(report.read,:type=>'text/csv;charset=iso-8859-1;
		     header=present',:filename=>"#{klassname.pluralize}-#{curdatetime}.csv",
		     :disposition =>'attachment', :encoding => 'utf8')
			end
		end
  end
  
end
