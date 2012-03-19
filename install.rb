#! /usr/bin/env ruby
#

require "FileUtils"

src = File.join(File.dirname(__FILE__), "assets")
dest = ENV['HOME']
puts "Installing to home directory..."
FileUtils.cp_r "#{src}/.", dest
puts "Done!"
