module Captain
  class Rules
    attr_reader :errors
    attr_reader :lines

    def initialize(lines)
      @lines = lines
      @errors = []
    end

    def validate!
      nil_lines? && valid_title? && valid_second_line? && valid_body?
    end

    private

    def filtered_lines
      @filtered_lines ||= @lines.reject { |line| line =~ /\A\s*#/ }
    end

    def title
      @title ||= filtered_lines.first
    end

    def valid_title?
      return true if title.length <= 50 && !title.start_with?("\n")
      @errors << 'Error Title Line: Title should be less than 50 characters'
      false
    end

    def second_line
      @second_line ||= filtered_lines[1]
    end

    def valid_second_line?
      return true if second_line.start_with?("\n")
      @errors << 'Error Blank Line: Second line should be empty'
      false
    end

    def body
      @body ||= filtered_lines[2..-1]
    end

    def valid_body?
      return true if body.all? { |line| line.length <= 72 && !line.nil? }
      @errors << 'Error Line Length: No line should be over 72 characters'
      false
    end

    def nil_lines?
      return true if !second_line.nil? && !body.nil?
      @errors << 'Error Only Title Line: Message should be more than a title'
      false
    end
  end
end
