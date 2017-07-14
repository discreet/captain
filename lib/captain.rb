require_relative 'info'

class Captain
  include Info

  def initialize(test)
    @test = test
  end

  attr_reader :test
end
