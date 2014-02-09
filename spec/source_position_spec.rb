require 'spec_helper'
require 'lib/source_range'

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
end
