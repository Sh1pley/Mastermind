require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'

class UserTest < Minitest::Test

  def test_it_exists
    assert User.new
  end

  def test_it_can_convert_guess_into_an_array
    result = User.new.converted_guess("rrrr")

    assert_equal (["R","R","R","R"]), result
  end
end