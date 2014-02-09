require 'parser/current'

class ParsedSource
  attr_accessor :ast

  def initialize(ast)
    @ast = ast
  end

  def find_node(position)
    true
  end

  def self.parse(src)
    ParsedSource.new(Parser::CurrentRuby.parse(src))
  end
end
