class ParsedSource
  attr_accessor :ast, :comments, :tokens

  def initialize(ast, comments, tokens)
    self.ast = ast
    self.comments = comments
    self.tokens = tokens
  end

  def self.parse(filename, src)
    parser = Parser::CurrentRuby.new
    source_buffer = Parser::Source::Buffer.new(filename)
    source_buffer.source = src
    ParsedSource.new(*parser.tokenize(source_buffer))
  end
end
