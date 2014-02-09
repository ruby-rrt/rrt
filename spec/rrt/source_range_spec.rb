require 'spec_helper'

module RRT
  describe SourceRange do
    it 'is initialized with start_position and end_position' do
      source_range = SourceRange.new(SourcePosition.new(0, 0),
                                    SourcePosition.new(0, 1))
      expect(source_range.start_position.line).to eq(0)
      expect(source_range.start_position.column).to eq(0)
      expect(source_range.end_position.line).to eq(0)
      expect(source_range.end_position.column).to eq(1)
    end

    it 'raises ArgumentError if start_position is not before end_position' do
      expect {
        SourceRange.new(SourcePosition.new(0, 1), SourcePosition.new(0, 0))
      }.to raise_error(ArgumentError)
    end

    describe '#valid_for?' do
      it 'returns true if source range is valid for the given source lines' do
        source_range = SourceRange.new(SourcePosition.new(1, 1),
                                      SourcePosition.new(2, 2))
        expect(source_range.valid_for?(['', '01', '012'])).to be_true
      end

      describe 'returns false if source range is invalid for the given source lines' do
        it 'empty array' do
          source_range = SourceRange.new(SourcePosition.new(0, 0),
                                        SourcePosition.new(0, 0))
          expect(source_range.valid_for?([])).to be_false
        end

        it 'line is out of range' do
          source_range = SourceRange.new(SourcePosition.new(1, 2),
                                        SourcePosition.new(2, 3))
          expect(source_range.valid_for?(['', ''])).to be_false
        end

        it 'column is out of range' do
          source_range = SourceRange.new(SourcePosition.new(1, 1),
                                        SourcePosition.new(1, 2))
          expect(source_range.valid_for?(['', ''])).to be_false
        end
      end
    end
  end
end
