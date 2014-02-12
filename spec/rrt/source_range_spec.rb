require 'spec_helper'

module RRT
  describe SourceRange do
    describe '.new' do
      it 'raises ArgumentError if start_position and end_position are not in the same source' do
        source1 = Source.new('')
        source2 = Source.new('')
        expect {
          SourceRange.new(source1.position(0, 0), source2.position(0, 1))
        }.to raise_error(ArgumentError)
      end

      it 'raises ArgumentError if start_position is not before end_position' do
        source = Source.new('line')
        expect {
          SourceRange.new(source.position(0, 1), source.position(0, 0))
        }.to raise_error(ArgumentError)
      end
    end
  end
end
