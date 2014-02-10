module RRT
  SourceRange = Struct.new(:start_position, :end_position) do
    def initialize(start_position, end_position)
      raise ArgumentError, 'Start position cannot be after end position' if start_position > end_position
      super(start_position, end_position)
    end

    def valid_for?(lines)
      start_position.valid_for?(lines) && end_position.valid_for?(lines)
    end
  end
end
