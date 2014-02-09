module RRT
  class ParsedSource
    attr_reader :ast

    def initialize(ast)
      @ast = ast
    end

    def find_node(position)
      true
    end

    def self.parse(src)
      self.new(Parser::CurrentRuby.parse(src))
    end
  end
end
