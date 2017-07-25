module Captain
  class Rules
    def initialize(file)
      @file = file
    end

    def title
      @title ||= @file.lines.first
    end

    def valid_title?
      @title.length <= 50
    end

    def blank_line
      @blank_line ||= @file.lines[1]
    end

    def valid_blank_line?
      @blank_line.empty?
    end

    def body
      @body ||= @file.lines[2..-1].reject { |line| line =~ /\A\s*#/ }
    end

    def body_valid?
        body.all? { |line| line <= 72 }
    end

    # disabling Metrics/MethodLength for the below method since it is just used
    # to create an array of error messages.
    # rubocop:disable Metrics/MethodLength

    def errors
      errors = []

      unless valid_title?
        errors << 'Error Title Line: Title should be less than 50 characters'
      end

      unless valid_blank_line?
        errors << 'Error Blank Line: Second line should be empty'
      end

      unless valid_line_length?
        errors << 'Error Line Length: No line should be over 72 characters'
      end

      errors
    end

    # rubocop:enable Metrics/MethodLength
  end
end
