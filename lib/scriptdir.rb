# This module will get the absolute path of the script being executed
#
module Script
  def self.dir
    File.expand_path(File.dirname(__FILE__))
  end
end
