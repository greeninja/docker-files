#!/usr/bin/env ruby

require 'sinatra'
require 'json'
require 'yaml'
require 'pp'
require 'logger'

set :bind, '0.0.0.0'
set :port, 80

repo = ENV['REPO']

puts "repo = #{repo}"

post "/payload" do
  push = JSON.parse(request.body.read)
  puts "SSH address: #{push['project']['git_ssh_url']}"
  puts "Branch (maybe): #{push['ref']}"
  puts "Default branch: #{push['project']['default_branch']}"

  branch = push['ref'].split('/').last

  if Dir.exist?("/environments/#{branch}")
    puts "Directory: /environments/#{branch} exists"
    puts "Ensuring branch up to date"
    pull = `git -C /environments/#{branch} pull`
  else
    puts "Directory: /environments/#{branch} does not exist. Cloning repo"
    puts "Cloning repo"
    clone = `git clone -b #{branch} #{repo} /environments/#{branch}`
  end

  # Now respond
  'ok'
end
