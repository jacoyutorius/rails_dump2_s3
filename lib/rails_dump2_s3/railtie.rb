require "rails_dump2_s3"
require "rails"

module RailsDump2S3
  class Railtie < Rails::Railtie
    railtie_name :rails_dump2_s3

    rake_tasks do
      load "tasks/rails_dump2_s3_tasks.rake"
    end
  end
end
