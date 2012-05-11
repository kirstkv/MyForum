#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'rake'
require "rspec/core/rake_task" # RSpec 2.0



# RSpec 2.0
RSpec::Core::RakeTask.new(:core) do |spec|
  spec.pattern = 'spec/erector/*_spec.rb'
  spec.rspec_opts = ['--backtrace']
end




require File.expand_path('../config/application', __FILE__)

Forumapp::Application.load_tasks
