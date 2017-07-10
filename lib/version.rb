# This module will go through the steps of modifying and validating the
# pipeline.properties file has the correct increment specified for the Orion
# tagging functionalit.
#
module Increment
  def self.get(propertiesfile)
    @properties = File.read(propertiesfile)
    @increment = @properties[/(major$|minor$|patch$)/]
  end

  def self.new
    print "version to increment [#{@version}]: "
    STDIN.reopen('/dev/tty')
    @version = $stdin.gets.chomp
  end

  def self.validate
    @version = @increment if @version.eql?('')
    return false if @version != @increment
    File.open('/tmp/hookStatus', 'a')\
      { |f| f.write("tagVersion: keeping existing value\n") }
    exit 0
  end

  def self.update(propertiesfile)
    newIncrement = @properties.gsub(/(major$|minor$|patch$)/, @version)
    File.open(propertiesfile, 'w') { |file| file.puts newIncrement }
    File.open('/tmp/hookStatus', 'a')\
      { |f| f.write("tagVersion: changing to #{@version}\n") }
  end
end
