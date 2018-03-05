#!/usr/bin/env ruby

require 'open-uri'
require 'socket'
require 'fileutils'
require 'yaml'
require 'digest/md5'

# Set things

root = "/storage"
host = Socket.gethostname
path = "#{root}/#{host}"
@run = 1
@debug = ENV["debug"] || nil


def create_dir(path)
  puts "Running create dir - run #{@run}" unless @debug.nil?
  Dir.mkdir path
  Dir.mkdir "#{path}/linux"
end

def get_kernel(path)
  puts "Running get_kernel - run #{@run}" unless @debug.nil?
  download = open("https://git.kernel.org/torvalds/t/linux-4.16-rc4.tar.gz")
  IO.copy_stream(download, "#{path}/linux.tar.gz")
end

def unpack_kernel(path)
  puts "Running unpack_kernel - run #{@run}" unless @debug.nil?
  cmd = "tar -zxf #{path}/linux.tar.gz -C #{path}/linux"
  unpack = system(cmd)
  if unpack == false
    abort
  end
end

def md5sum_check(path)
  puts "Running md5sum_kernel - run #{@run}" unless @debug.nil?
  truths = YAML.load_file("/truth.yaml")
  truths.each do |k, v|
    check = Digest::MD5.hexdigest(File.read("#{path}/#{k}"))
    unless check == v
      puts "Error!\n#{k} got #{check} should be #{v}"
    end
  end
end

def cleanup(path)
  puts "Running cleanup - run #{@run}" unless @debug.nil?
  puts "Run #{@run} complete"
  @run += 1
  FileUtils.rm_rf(path)
end

### Now call it

loop do
  create_dir(path)
  get_kernel(path)
  unpack_kernel(path)
  md5sum_check(path)
  cleanup(path)
end

