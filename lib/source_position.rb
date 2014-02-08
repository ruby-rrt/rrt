class SourcePosition
  attr_accessor :line, :column

  def initialize(line, column)
    self.line = line
    self.column = column
  end
end
