require 'spec_helper'

module RRT
  describe Source do
    describe '#position' do
      it 'returns a position in the source for the given line and column' do
        position = described_class.new("line1\nline2").position(1, 2)
        expect([position.line, position.column]).to eq([1, 2])
      end

      it 'throws an error when position is outside the source' do
        [
          ['', [0, 0]],
          ['line', [0, 4]],
          ['line', [1, 0]]
        ].each do |source, position|
          expect {
            described_class.new(source).position(*position)
          }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
