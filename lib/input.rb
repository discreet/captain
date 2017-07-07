# This module reuses the code needed to take input from the user in order to
# know where to execute the given test.
#
module Input
  def self.getDir(test)
    print "specify directory to run #{test} in: "
    STDIN.reopen('/dev/tty')
    $stdin.gets.chomp
  end
end
