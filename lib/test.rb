# This module will be used to build the necessary methods for running the
# different tests necessary to validate code.
#
module Test
  def self.gradle(cmd)
    system("gradle #{cmd} --daemon")
  end

  def self.maven(cmd)
    system("mvn #{cmd}")
  end

  def self.rubocop(cmd)
    system("rubocop #{cmd}")
  end

  def self.cft(profile, file)
    system("aws --profile #{profile} cloudformation validate-template \
           --template-body file://#{file}")
  end
end
