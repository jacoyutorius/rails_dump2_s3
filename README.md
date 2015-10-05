# RailsDump2S3

[![Gem Version](https://badge.fury.io/rb/rails_dump2_s3.svg)](http://badge.fury.io/rb/rails_dump2_s3)

Dump rails db to YAML format, and submit to AmazonS3.


## Description

Execute "db:data:dump" (it depends on 'YAML_DB' gem). and upload output file to AmazonS3.

(2015.6.2)
it still not support to AWS-SDKv2, sorry.


## Usage

```bash
export AWS_ACCESS_KEY="Your aws acccess key"
export AWS_SECRET_ACCESS_KEY="Your aws secret acccess key"

rake rails_dump2_s3:dump
```

* adding prefix to file

```
export DUMP2S3_PREFIX=major
bin/rake rails_dump2_s3:dump
 => adding: db/base-development-major-2015-10-05-183924.zip
```


## Install

```bash
gem install "rails_dump2_s3"
```


## Licence

[MIT](https://github.com/nils-werner/dump_db/blob/master/LICENCE)

## Author

[jacoyutorius](https://github.com/jacoyutorius)

