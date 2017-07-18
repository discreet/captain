module Captain
  class Test

    def self.gradle(*cmd)
       system('gradle', '--daemon', cmd)
    end

    def self.maven(*cmd)
      system('mvn',cmd)
    end

    def self.rubocop(*cmd)
      system('rubocop', cmd)
    end

    def self.cft(profile, file)
      system('aws', '--profile', profile, 'cloudformation', \
             'validate-template', '--template-body', "file://#{file}")
    end
  end
end
