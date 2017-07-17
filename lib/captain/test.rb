module Captain
  class Test
    attr_reader :test

    def initialize(test)
      @test = test
    end

    def gradle(*cmd)
       system('gradle', '--daemon', cmd)
    end

    def maven(*cmd)
      system('mvn',cmd)
    end

    def rubocop(*cmd)
      system('rubocop', cmd)
    end

    def cft(profile, file)
      system('aws', '--profile', profile, 'cloudformation', \
             'validate-template', '--template-body', "file://#{file}")
    end
  end
end
