# RailsDump2S3

[![Gem Version](https://badge.fury.io/rb/rails_dump2_s3.svg)](http://badge.fury.io/rb/rails_dump2_s3)

Dump rails db to YAML format, and submit to AmazonS3.


## Description

Execute "db:data:dump" (it depends on 'YAML_DB' gem). and upload output file to AmazonS3.


## Usage

```bash
export AWS_ACCESS_KEY="Your aws acccess key"
export AWS_SECRET_ACCESS_KEY="Your aws secret acccess key"

rake rails_dump2_s3:dump
```


## Install

```bash
gem install "rails_dump2_s3"
```

## Contribution


## Licence

[MIT](https://github.com/nils-werner/dump_db/blob/master/LICENCE)

## Author

[jacoyutorius](https://github.com/jacoyutorius)

