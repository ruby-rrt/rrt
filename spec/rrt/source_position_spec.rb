require 'spec_helper'

module RRT
  describe SourcePosition do
    describe '#<=>' do
      it 'positions are equal when they have same line and column' do
        expect(source_position(0, 0)).to eq(source_position(0, 0))
      end

      it 'position is less than other if line number is smaller' do
        expect(source_position(0, 0)).to be < source_position(1, 0)
      end

      it 'position is less than other if column number is smaller' do
        expect(source_position(0, 0)).to be < source_position(0, 1)
      end

      private

      def source_position(line, column)
        described_class.new("line\nline", line, column)
      end
    end
  end
end
