# Vagrant::Pseudomuto

[![Build Status](https://travis-ci.org/pseudomuto/vagrant-pseudomuto.png)](https://travis-ci.org/pseudomuto/vagrant-pseudomuto)

This is my custom vagrant plugin for managing guest machine setup.

Since this is mostly just for my custom setup, and likely only useful to others as a reference, I won't be publishing this gem to rubygems.

## Installation

Create a new directory for your application and add the following to your _Gemfile_

```
gem 'vagrant-pseudomuto', github: 'pseudomuto/vagrant-pseudomuto'
```

Then run the following:

```
bundle install
vagrant pseudo-init
```
