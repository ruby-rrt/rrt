module RRT
  class Source
    def initialize(raw_source)
      @raw_source = raw_source
    end

    def position(line, column)
      fail ArgumentError, 'Invalid position' unless line < lines.size && column < lines[line].size
      SourcePosition.new(self, line, column)
    end

    def position_from_range(range)
      position(range.line - 1, range.column)
    end

    def lines
      @lines ||= @raw_source.lines.to_a
    end
  end
end
