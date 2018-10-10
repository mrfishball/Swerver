#!/usr/bin/env bash

cd ./http_server_spec/
bundle install
bundle exec spinach --tags ~@simple-post