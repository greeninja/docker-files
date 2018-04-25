#!/usr/bin/env ruby

require 'sinatra'
require 'json'
require 'yaml'
require 'pp'
require 'logger'

set :bind, '0.0.0.0'
set :port, 80

repo = ENV['REPO']
debug = ENV['debug'] || nil

# Set logging level
logger = Logger.new(STDOUT)
if debug.nil?
  logger.level = Logger::INFO
else
  logger.level = Logger::DEBUG
end

logger.debug("repo = #{repo}")

post "/payload" do
  push = JSON.parse(request.body.read)
  logger.debug("Full push object: #{ push }")

  branch = push['ref'].split('/').last
  if push['after'] == "0000000000000000000000000000000000000000"
    logger.debug("After check sum suggests branch deletion")
    deleted_branch = true
  else
    deleted_branch = false
  end

  if Dir.exist?("/environments/#{branch}") and deleted_branch == false
    logger.debug("Directory: /environments/#{branch} exists")
    logger.info("Ensuring branch #{branch} up to date")
    pull = "git -C /environments/#{branch} pull"
    logger.debug("I ran #{pull}")
    cmd = `#{pull}`
    result = $?.exitstatus
    if result != 0
      logger.debug("Get error from cmd: #{result}")
      status 500
      body "Error raised in repo_sync"
    end
  elsif delete_branch == false
    logger.debug("Directory: /environments/#{branch} does not exist. Cloning repo")
    logger.info("Cloning repo #{repo} and branch #{branch}")
    clone = "git clone -b #{branch} #{repo} /environments/#{branch}"
    logger.debug("I ran #{clone}")
    cmd = `#{clone}`
    result = $?.exitstatus
    if result != 0
      logger.debug("Get error from cmd: #{result}")
      status 500
      body "Error raised in repo_sync"
    end
  elsif Dir.exist?("/environments/#{branch}") and deleted_branch == true
    logger.debug("Directory: /environments/#{branch} exists")
    logger.info("Removing branch #{branch}")
    del_branch = "rm /environments/#{branch} -rf"
    cmd = `#{del_branch}`
    result = $?.exitstatus
    if result != 0
      logger.debug("Get error from cmd: #{result}")
      status 500
      body "Error raised in delete branch"
    end
  end

  # Now respond
  'ok'
end
