SourceRange = Struct.new(:start_position, :end_position) do
  def initialize(start_position, end_position)
    raise ArgumentError, 'Start position cannot be after end position' if start_position > end_position
    super(start_position, end_position)
  end

  def valid_for?(lines)
    end_position.line < lines.size && end_position.column < lines[end_position.line].size
  end
end
