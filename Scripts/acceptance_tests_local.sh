#!/usr/bin/env bash

cd ~/desktop/Swerver/http_server_spec/
bundle install
bundle exec spinach --tags ~@simple-post
