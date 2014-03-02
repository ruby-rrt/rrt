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
      it 'finds a node from passed in position when the position matches the beginning of an expression' do
        assert_location([0, 4], [0, 4])
      end

      it 'finds a node from passed in position when the position is in the middle of an expression' do
        assert_location([0, 6], [0, 4])
      end

      it 'finds a node from passed in position when the position is before an expression' do
        assert_location([0, 3], [0, 4])
        assert_location([0, 2], [0, 4])
        assert_location([0, 1], [0, 4])
      end

      it 'finds a node from passed in position when the position is after an expression' do
        assert_location([0, 7], [0, 4], :right)
        assert_location([0, 8], [0, 4], :right)
        assert_location([0, 9], [0, 4], :right)
      end

      private

      def assert_location(position, expected_location, trimming_from = :left)
        parsed_source = parse('1 + var + 3')
        pos = parsed_source.source.position(*position)
        node_location = parsed_source.find_node(pos, trimming_from).location
        node_position = parsed_source.source.position_from_range(node_location)
        expect([node_position.line, node_position.column]).to eq(expected_location)
      end
    end

    private

    def parse(src)
      described_class.parse(src)
    end
  end
end
