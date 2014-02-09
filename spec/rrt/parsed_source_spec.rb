require 'spec_helper'

module RRT
  describe ParsedSource do
    describe '.parse' do
      it 'creates an instance from passed in source' do
        parsed_source = parse('1 + 2')
        expect(parsed_source).to be_an_instance_of(described_class)
      end
    end

    describe '#find_node' do
      it 'finds a node from passed in position' do
        parsed_source = parse('1 + 2 + 3')
        node = parsed_source.find_node(SourcePosition.new(0, 2))
        expect(node).not_to be_nil
      end
    end

    private

    def parse(src)
      described_class.parse(src)
    end
  end
end
