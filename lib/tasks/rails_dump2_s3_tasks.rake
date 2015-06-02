require "yaml_db"
require "aws-sdk"

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
		zipname = "base-#{Rails.env}"

		system("bin/rake db:data:dump_dir")
    system("zip db/#{zipname}.zip db/base/*")
    s3_object.objects[Time.now.strftime("base-#{Rails.env}-%Y-%m-%d-%H%M%S.zip")].write(file: "db/#{zipname}.zip")
	end
end