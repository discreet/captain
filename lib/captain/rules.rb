module Captain
  class Rules
    attr_reader :errors

    def initialize(lines)
      @lines = lines
      @errors = []
    end

    def title
      @title ||= @lines.first
    end

    def valid_title?
      return true if title.length <= 50
      @errors << 'Error Title Line: Title should be less than 50 characters'
    end

    def blank_line
      @blank_line ||= @lines[1]
    end

    def valid_blank_line?
      return true if blank_line.empty?
      @errors << 'Error Blank Line: Second line should be empty'
    end

    def body
      @body ||= @lines[2..-1].reject { |line| line =~ /\A\s*#/ }
    end

    def valid_body?
      return true if body.all? { |line| line.length <= 72 }
      @errors << 'Error Line Length: No line should be over 72 characters'
    end

    def validate!
      valid_title? && valid_blank_line? && valid_body?
      return false if @errors
    end
  end
end
