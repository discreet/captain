# This module reuses the code needed to detect if there are changes to specific
# set of files or directories. This will determine if a test needs to run or if
# you can safely move on because there are no changes.
#
module Changes
  def self.findChanges(changesDir, test)
    system("git diff --staged --name-only | grep #{changesDir}/")
    case $CHILD_STATUS.zero?
    when false
      File.open('/tmp/hookStatus', 'a') { |f| f.write("#{test}: no changes\n") }
      exit 0
    when true
      return true
    end
  end
end
