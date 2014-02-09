require 'lib/parsed_source'

class ExtractVariable
  # TODO:
  # - Auto-adjust start/end positions to match nearest AST node.
  # - Handle multi-line definitions?
  # - Replace all occurrences of extracted expression in the scope with variable (moving variable definition above the first use).
  # - Detect variable redefinition?
  # - Test if it works with CRLF line endings.

  def apply(filename, source, source_range, variable_name)
    source_lines = source.lines.to_a

    raise ArgumentError, 'invalid range' unless source_range.start_position.line == source_range.end_position.line &&
      source_range.valid_for?(source_lines)

    column_range = source_range.start_position.column..source_range.end_position.column

    variable_value = source_lines[source_range.start_position.line][column_range]
    source_lines[source_range.start_position.line][column_range] = variable_name

    variable_definition = "#{variable_name} = #{variable_value}"
    source_lines.insert(source_range.start_position.line, variable_definition)
    source_lines.join("\n")
  end
end
