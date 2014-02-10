require 'spec_helper'

module RRT
  describe SourcePosition do
    describe '#<=>' do
      it 'positions are equal when they have same line and column' do
        expect(SourcePosition.new(0, 0)).to eq(SourcePosition.new(0, 0))
      end

      it 'position is less than other if line number is smaller' do
        expect(SourcePosition.new(0, 1)).to be < SourcePosition.new(1, 0)
      end

      it 'position is less than other if column number is smaller' do
        expect(SourcePosition.new(0, 0)).to be < SourcePosition.new(0, 1)
      end
    end

    describe '#valid_for' do
      it 'returns true when position is valid for passed in lines' do
        expect(SourcePosition.new(1, 0).valid_for?(['', '0'])).to be_true
      end

      it 'returns false when line is out of range' do
        expect(SourcePosition.new(0, 0).valid_for?([])).to be_false
        expect(SourcePosition.new(1, 0).valid_for?(['0'])).to be_false
      end

      it 'returns false when column is out of range' do
        expect(SourcePosition.new(0, 1).valid_for?(['0'])).to be_false
      end
    end
  end
end
