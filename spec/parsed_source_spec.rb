require 'spec_helper'
require 'lib/parsed_source'

describe ParsedSource, '#parse' do
  it 'creates an instance from passed in source' do
    src = '1 + 2 + 3'
    filename = 'x.rb'
    parsed_source = ParsedSource.parse(filename, src)
    expect(parsed_source.ast.type).to eq(:send)
  end
end
