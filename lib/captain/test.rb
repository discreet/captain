module Captain
  class Test
    attr_reader :test

    def initialize(test)
      @test = test
    end

    case @test
    when 'gradle'
      def gradle(cmd)
        system("gradle #{cmd}")
      end
    end
  end
end
