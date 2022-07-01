class JavascriptObjectParser
  # don't judge me **stares back at you**
  #                  T                T
  #                  | ______________ |
  UnclosedObjectError = Class.new(StandardError)

  attr_reader :raw_text

  def initialize(raw_text)
    @raw_text = raw_text
  end

  def to_h
    raise UnclosedObjectError unless is_closed_object?

    # Sanitize the beginning and end for parsing
    # as plain object
    parsed = raw_text.split(/\r?\n/).tap do |buf|
      buf[0] = '{'
      buf[-1] = '}'
    end.map(&:strip).join("\n")

    # replace nulls with nil
    parsed.gsub!(/null/, 'nil')

    YAML.safe_load(parsed)
  end

  private

  def first_line
    raw_text.split("\n").first
  end

  def last_line
    raw_text.split("\n").last
  end

  # NOTE: these functions assume that the variable_declaration is for an object
  def variable_declaration?(line)
    line.strip.match?(/[var,const,let]+\s\w+\s?=/)
  end

  def closing_bracket?(line)
    line.strip.match?(/};?/)
  end

  def is_closed_object?
    variable_declaration?(first_line) && closing_bracket?(last_line)
  end
end
