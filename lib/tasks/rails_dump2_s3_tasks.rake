require "yaml_db"
require "aws-sdk"

def s3 
	AWS::S3.new(
		access_key_id: ENV["AWS_ACCESS_KEY"],
		secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
		)
end

def app_name
	Rails.application.class.parent_name.underscore
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

		prefix = ENV["DUMP2S3_PREFIX"] || ""

		name = []
		name << "base"
		name << Rails.env
		name << prefix if prefix.present?
		name << "#{Time.now.strftime("%Y-%m-%d-%H%M%S")}"
		filename = name.join("-")

		system("bin/rake db:data:dump_dir dir=#{filename}")
    system("zip db/#{filename}.zip db/#{filename}/*")
    s3_object.objects["#{filename}.zip"].write(file: "db/#{filename}.zip")
	end
end