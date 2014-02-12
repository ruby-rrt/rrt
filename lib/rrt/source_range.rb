module RRT
  SourceRange = Struct.new(:start_position, :end_position) do
    def initialize(start_position, end_position)
      unless start_position.source.equal?(end_position.source)
        fail ArgumentError, 'Start and end positions from different sources'
      end
      fail ArgumentError, 'Start position cannot be after end position' if start_position > end_position

      super(start_position, end_position)
    end
  end
end
