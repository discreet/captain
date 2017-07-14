module Captain
  class Changes
    attr_reader :directory

    def initialize
      @directory = choose_dir
    end

    def changed?
      system("git diff --staged --name-only | grep #{directory}")
    end

    private

    def choose_dir
      print "specify directory to run in: "
      STDIN.reopen('/dev/tty')
      $stdin.gets.chomp
    end
  end
end
