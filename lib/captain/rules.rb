module Captain
  class Rules
    def initialize(line_number)
      @line_number = line_number
      @real_line_number = line_number + 1
    end

    def self.title_line(line)
      return if @line_number.zero? && line.length > 50
      "Error #{@real_line_number}: First line should be less than 50 \
      characters in length."
    end

    def self.blank_line(line)
      "Error #{@real_line_number}: Second line should be empty." \
      if @line_number == 1 && !line.empty?
    end

    def self.line_chars(line)
      return if line.length > 72 && line[0, 1] != '#'
      "Error #{@real_line_number}: No line should be over 72 characters \
      long."
    end

    def self.fix
      print 'Invalid git commit message format. Press y to edit and n to \
      cancel the commit. [y/n]: '
      choice = $stdin.gets.chomp
      exit 1 if %w[no n].include?(choice.downcase)
    end
  end
end
