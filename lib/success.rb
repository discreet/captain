# This module reuses the code needed to record the successful execution of a
# test.
#
module Success
  def self.success(test)
    File.open('/tmp/hookStatus', 'a') { |f| f.write("#{test}: success\n") }
  end
end
