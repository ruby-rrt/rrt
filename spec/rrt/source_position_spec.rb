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
    end

    describe '#+' do
      it 'gives the same position when adding 0' do
        expect(source_position(0, 1) + 0).to eq(source_position(0, 1))
      end

      it 'gives the next position when adding 1' do
        expect(source_position(0, 1) + 1).to eq(source_position(0, 2))
      end

      it 'gives the next position when it\'s on a subsequent line' do
        expect(source_position(0, 1) + 4).to eq(source_position(1, 0))
        expect(source_position(0, 1) + 6).to eq(source_position(1, 2))
      end

      it 'works with negative numbers' do
        expect(source_position(0, 3) + -1).to eq(source_position(0, 2))
      end
    end

    describe '#-' do
      it 'gives the same position when subtracting 0' do
        expect(source_position(0, 2) - 0).to eq(source_position(0, 2))
      end

      it 'gives the next position when subtracting 1' do
        expect(source_position(0, 2) - 1).to eq(source_position(0, 1))
      end

      it 'gives the previous position when it\'s on a preceding line' do
        expect(source_position(1, 1) - 2).to eq(source_position(0, 4))
        expect(source_position(1, 1) - 4).to eq(source_position(0, 2))
      end

      it 'works with negative numbers' do
        expect(source_position(0, 1) - -1).to eq(source_position(0, 2))
      end
    end

    private

    def source_position(line, column)
      described_class.new(Source.new("line\nline"), line, column)
    end
  end
end
