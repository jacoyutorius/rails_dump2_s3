module SerializationHelper
	class Dump
		def self.tables
			tables = ActiveRecord::Base.connection.tables.reject { |table| ['schema_info', 'schema_migrations'].include?(table) }

    	if ENV.include? "EXCLUDE_TABLES"
    		p "exclude #{ENV["EXCLUDE_TABLES"]}"
	    	tables = tables.select{|r| ENV["EXCLUDE_TABLES"].split(",").exclude?(r) }  
  		end

    	tables
    end
	end
end