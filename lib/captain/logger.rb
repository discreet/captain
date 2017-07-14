require 'forwardable'
require 'logger'

module Captain
  class Logger
    extend Forwardable

    attr_reader :logger

    def intitialize(filename = '/tmp/captain.log')
      @logger = ::Logger.new(filename, 'monthly')
    end

    def_delegators :logger, :error, :info, :warn, :debug
  end
end
