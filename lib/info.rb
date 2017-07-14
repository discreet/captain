module Info
  @hooksFile = '/tmp/hookStatus'

  def self.scriptDir
    File.expand_path(File.dirname(__FILE__))
  end

  def self.getDir
    print "specify directory to run #{@test}: "
    STDIN.reopen('/dev/tty')
    $stdin.gets.chomp
  end

  def self.findChanges(appDir)
    system("git diff --staged --name-only | grep #{appDir}/")
    case $CHILD_STATUS.exitstatus.zero?
    when true
      return true
    when false
      File.open(@hooksFile, 'a') { |f| f.write("#{@test}: no changes\n") }
      exit 0
    end
  end

  def self.success
    File.open(@hooksFile, 'a') { |f| f.write("#{@test}: success\n") }
  end
end
