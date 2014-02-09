require 'spec_helper'

module RRT
  module Refactorings
    describe ExtractVariable do
      describe '#apply' do
        it 'extracts code to variable' do
          source = '1 + 2 + 3'
          filename = 'x.rb'
          source_range = SourceRange.new(SourcePosition.new(0, 4), SourcePosition.new(0, 8))
          extracter = described_class.new
          variable_name = 'x'
          result = extracter.apply(filename,
                                  source,
                                  source_range,
                                  variable_name)
          expect(result).to eq("x = 2 + 3\n1 + x")
        end
      end
    end
  end
end
