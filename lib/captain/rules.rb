module Captain
  class Rules
    real_line_number = line_number + 1

    def self.title_line(line, line_number)
      if line_number.zero? && line.length > 50
        return "Error #{real_line_number}: First line should be less than 50 \
        characters in length."
      end
    end

    def self.blank_line(line, line_number)
      if line_number == 1 && !line.empty?
        return "Error #{real_line_number}: Second line should be empty."
      end
    end

    def self.line_chars(line)
      if line.length > 72 && line[0, 1] != '#'
        return "Error #{real_line_number}: No line should be over 72 \
        characters long."
      end
    end

    def self.fix
      print 'Invalid git commit message format. Press y to edit and n to \
      cancel the commit. [y/n]: '
      choice = $stdin.gets.chomp
      exit 1 if %w(no n).include?(choice.downcase)
    end
end
