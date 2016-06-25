module GMapsData
  class InvalidFormatError < Exception; end

  MATRIX_MATCHER = /\d*m\d*/

  module_function

  def decode(data)
    raise InvalidFormatError if data[0] != '!'

    _, tail = data[1..-1].split("!", 2)
    elements = tail.split("!")

    decode_value([], elements)
  end

  def decode_value(data, elements)
    elem = elements.shift

    return unless elem

    if MATRIX_MATCHER.match(elem)
      data.push decode_value([], elements)
    else
      data.push parse_value(elem)
      decode_value(data, elements)
    end

    data.compact
  end

  def parse_value(elem)
    case elem[1]
    when "b" then
      elem[2] == "1"
    else
      elem[2..-1]
    end
  end
end

