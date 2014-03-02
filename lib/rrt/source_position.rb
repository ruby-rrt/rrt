module RRT
  SourcePosition = Struct.new(:source, :line, :column) do
    include Comparable

    def <=>(other_position)
      return line <=> other_position.line if line != other_position.line
      return column <=> other_position.column if column != other_position.column
      0
    end

    def +(n)
      return self.-(-n) if n < 0

      current_line_length = source.lines[line].size
      if column + n < current_line_length
        source.position(line, column + n)
      else
        source.position(line + 1, 0) + (n - (current_line_length - column))
      end
    end

    def -(n)
      return self.+(-n) if n < 0

      if column - n >= 0
        source.position(line, column - n)
      else
        source.position(line - 1, source.lines[line - 1].size - 1) - (n - (column + 1))
      end
    end
  end
end
