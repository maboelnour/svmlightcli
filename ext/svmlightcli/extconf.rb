require "mkmf"

# The $makefile_created and fake library are taken from:
# https://yorickpeterse.com/articles/hacking-extconf-rb/

# copy Makefile which is beside this file to current working directory
# this is only needed in the Makefile preparation phase
# later on, when installing the gem using gem or bundle
# Makefile is used from the ext/svmlightcli directory
begin
  makefile = File.expand_path('../Makefile', __FILE__)
  FileUtils.cp(makefile, '.')
  # replace SRC_DIR in the copied Makefile with the correct path
  src_dir = File.dirname __FILE__
  new_contents = File.read('Makefile').sub("SRC_DIR=.", "SRC_DIR=#{src_dir}")
  File.write('Makefile', new_contents)
rescue Exception => e
  # in the installation phase, cp will complain from copying to same dir
end

# This is normally set by calling create_makefile() but we don't need that
# method since we'll provide a dummy Makefile. Without setting this value
# RubyGems will abort the installation.
$makefile_created = true

# Create a dummy extension file. Without this RubyGems would abort the
# installation process. On Linux this would result in the file "svmlightcli.so"
# being created in the current working directory.
#
# Normally the generated Makefile would take care of this but since we
# don't generate one we'll have to do this manually.
#
File.write("svmlightcli.#{RbConfig::CONFIG['DLEXT']}", '')
