#-*- mode: ruby -*-
require 'ruby-maven'

desc "Pack jar after compiling classes"
task :compile do
  RubyMaven.exec('prepare-package')
end

desc "Clean build"
task :clean do
  RubyMaven.exec('clean')
end

task :default => [ :compile ]

require 'rubygems/package_task'
Gem::PackageTask.new( eval File.read( 'ansj_seg.gemspec' ) ) do
  desc 'Pack gem'
  task :package => [:compile]
end