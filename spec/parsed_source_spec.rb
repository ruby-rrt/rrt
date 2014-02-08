require 'spec_helper'
require 'lib/parsed_source'

describe ParsedSource do
  describe '.parse' do
    it 'creates an instance from passed in source' do
      src = '1 + 2 + 3'
      filename = 'x.rb'
      parsed_source = ParsedSource.parse(filename, src)
      expect(parsed_source.ast.type).to eq(:send)
    end
  end

  describe '#find_node' do
    it 'finds a node from passed in position' do
      src = '1 + 2 + 3'
      filename = 'x.rb'
      parsed_source = ParsedSource.parse(filename, src)
      node = parsed_source.find_node(SourcePosition.new(0, 2))
      expect(node).not_to be_nil
    end
  end
end
