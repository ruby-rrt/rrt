module RRT
  SourcePosition = Struct.new(:line, :column) do
    include Comparable

    def <=>(other_position)
      return line <=> other_position.line if line != other_position.line
      return column <=> other_position.column if column != other_position.column
      0
    end

    def valid_for?(lines)
      line < lines.size && column < lines[line].size
    end
  end
end
