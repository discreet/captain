module Captain
  class Rules
    attr_reader :errors
    attr_reader :lines

    def initialize(lines)
      @lines = lines.reject { |line| line =~ /\A\s*#/ }
      @errors = []
    end

    def title
      @title ||= @lines.first
    end

    def valid_title?
      return true if title.length <= 50
      @errors << 'Error Title Line: Title should be less than 50 characters'
      return false
    end

    def second_line
      @second_line ||= @lines[1]
    end

    def valid_second_line?
      return true if second_line.start_with?("\n")
      @errors << 'Error Blank Line: Second line should be empty'
      return false
    end

    def body
      @body ||= @lines[2..-1]
    end

    def valid_body?
      return true if body.all? { |line| line.length <= 72 }
      @errors << 'Error Line Length: No line should be over 72 characters'
      return false
    end

    def validate!
      valid_title? && valid_second_line? && valid_body?
    end
  end
end
