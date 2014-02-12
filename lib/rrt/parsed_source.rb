module RRT
  class ParsedSource
    attr_reader :source

    def initialize(raw_source, ast)
      @source = Source.new(raw_source)
      @ast = ast
    end

    def find_node(position)
      find_node_in_tree(@ast, position)
    end

    def self.parse(src)
      self.new(src, Parser::CurrentRuby.parse(src))
    end

    private

    def find_node_in_tree(root, position)
      return nil unless root.instance_of?(Parser::AST::Node)
      if leaf?(root)
        return position_in_node?(position, root) ? root : nil
      end

      # optimized for short-circuiting in order not to traverse the whole AST when the node is found
      root.children.each do |child|
        node = find_node_in_tree(child, position)
        return node if node
      end

      nil
    end

    def position_in_node?(position, node)
      expression = node.location.expression
      begin_position = @source.position_from_range(expression.begin)
      end_position = @source.position_from_range(expression.end)
      begin_position <= position && position < end_position
    end

    def leaf?(root)
      root.children.none? { |child| child.instance_of?(Parser::AST::Node) }
    end
  end
end
