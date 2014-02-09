require 'spec_helper'

module RRT
  module Refactorings
    describe ExtractVariable do
      describe '#apply' do
        it 'extracts code to variable' do
          source = '1 + 2 + 3'
          source_range = SourceRange.new(SourcePosition.new(0, 4), SourcePosition.new(0, 8))
          extracter = described_class.new
          variable_name = 'x'
          result = extracter.apply(source,
                                  source_range,
                                  variable_name)
          expect(result).to eq("x = 2 + 3\n1 + x")
        end
      end
    end
  end
end
