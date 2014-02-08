class ParsedSource
  attr_accessor :ast

  def initialize(ast)
    @ast = ast
  end

  def find_node(position)
  end

  def self.parse(filename, src)
    parser = Parser::CurrentRuby.new
    source_buffer = Parser::Source::Buffer.new(filename)
    source_buffer.source = src
    ParsedSource.new(parser.tokenize(source_buffer)[0])
  end
end
