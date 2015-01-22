require "yaml_db"
require "aws-sdk"
require "pp"

def s3 
	AWS::S3.new(
		access_key_id: ENV["AWS_ACCESS_KEY"],
		secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
		)
end

def app_name
	Rails.application.class.parent_name
end

def s3_object
	bucket = s3.buckets[app_name]

	unless bucket.exists?
		bucket = s3.buckets.create(app_name)
	end

	bucket
end

namespace :rails_dump2_s3 do
	desc "execute db:data:dump, and submit to S3"
	task :dump => :environment do
	  format_class = ENV['class'] || "YamlDb::Helper"
    helper = format_class.constantize
    pp db_dump_data_file
    SerializationHelper::Base.new(helper).dump db_dump_data_file helper.extension

    s3_object.objects[Time.now.strftime("%Y-%m-%d-%H%M%S")].write(file: db_dump_data_file)
	end
end