module Captain
  class Test
    def self.directory(directory)
      Dir.chdir(File.expand_path(File.dirname(__FILE__)))
      Dir.chdir('../../')
      Dir.chdir(directory)
    end

    def self.gradle(*cmd)
      system('gradle', '--daemon', cmd)
    end

    def self.maven(*cmd)
      system('mvn', cmd)
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
