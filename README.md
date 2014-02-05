# Vagrant::Pseudomuto

[![Build Status](https://travis-ci.org/pseudomuto/vagrant-pseudomuto.png)](https://travis-ci.org/pseudomuto/vagrant-pseudomuto)

This is my custom vagrant plugin for managing guest machine setup.

Since this is mostly just for my custom setup, and likely only useful to others as a reference, I won't be publishing this gem to rubygems.

## Usage

If this is the first time you're using this, run `script/setup`. This script will add your SSH key (_~/.ssh/id_rsa) to the authentication agent and source `script/bootstrap`.

_script/bootstrap runs `bundle install --without test`...weird I know, but it's a vagrant thing. You ca  run this anytime without causing any issues.
