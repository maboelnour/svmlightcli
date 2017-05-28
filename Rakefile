require "bundler/gem_tasks"
require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("svmlightcli") do |ext|
  ext.lib_dir = "lib/svmlightcli"
end

task :default => [:clobber, :compile, :spec]
