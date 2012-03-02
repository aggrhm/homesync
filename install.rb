#! /usr/bin/env ruby
#

src = File.join(File.dirname(__FILE__), "assets")
dest = "~"
puts "Installing to home directory..."
FileUtils.cp_r "#{src}/.", dest
puts "Done!"
