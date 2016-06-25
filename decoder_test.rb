require "minitest/autorun"
require_relative 'decoder'

class TestDecoder < Minitest::Test
  def test_fail_if_no_bang
    assert_raises(GMapsData::InvalidFormatError) { GMapsData.decode("") }
  end

  def test_decode_4m5
    data = "!4m5!3m4!1s0x808f7e2378c6037d:0xdd294d82eb235474!8m2!3d37.7649179!4d-122.4189024"
    assert_equal [
      [
        "0x808f7e2378c6037d:0xdd294d82eb235474",
        [
          "37.7649179",
          "-122.4189024"
        ]
      ]
    ], GMapsData.decode(data)
  end

  def test_decode_3m1
    data = "!3m1!4b1!4m5!3m4!1s0x808f7e2378c6037d:0xdd294d82eb235474!8m2!3d37.7649179!4d-122.4189024"
    assert_equal [
      true,
      [
        [
          "0x808f7e2378c6037d:0xdd294d82eb235474",
          [
            "37.7649179",
            "-122.4189024"
          ]
        ]
      ]
    ], GMapsData.decode(data)
  end
end
