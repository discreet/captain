module Captain
  class Rules
    attr_reader :errors

    def initialize(file)
      @file = file
      @errors = []
    end

    def title
      @title ||= @file.lines.first
    end

    def valid_title?
      @title.length <= 50
      @errors << 'Error Title Line: Title should be less than 50 characters'
    end

    def blank_line
      @blank_line ||= @file.lines[1]
    end

    def valid_blank_line?
      @blank_line.empty?
    end

    def body
      @body ||= @file.lines[2..-1].reject { |line| line =~ /\A\s*#/ }
      @errors << 'Error Blank Line: Second line should be empty'
    end

    def body_valid?
        body.all? { |line| line <= 72 }
        @errors << 'Error Line Length: No line should be over 72 characters'
    end

    def validate!
      @errors = []
      valid_title? && valid_blank_line? && valid_body?
    end
  end
end
