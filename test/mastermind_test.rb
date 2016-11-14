require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test
  
  def test_it_exists
    assert Mastermind.new
  end

  def test_it_can_select_a_four_color_code_on_easy
    result = Mastermind.new
    result.computer.easy_mode
    
    assert_equal Array, result.computer.colors.class
    assert_equal 4, result.computer.colors.length
  end

  def test_it_can_return_secret_as_string
    result = Mastermind.new
    result.computer.easy_mode

    assert_equal true, result.computer.colors.include?("Y")
    assert_equal true, result.computer.colors.include?("B")
    assert_equal true, result.computer.colors.include?("R")
    assert_equal true, result.computer.colors.include?("G")
  end  

  def test_it_can_check_guess_for_too_long
    result = Mastermind.new
    result = result.check_guess_for_format("12345")

    assert_equal "...", result.join
  end

  def test_it_can_check_guess_for_too_short
    result = Mastermind.new
    result = result.check_guess_for_format("123")

    assert_equal "...", result.join
  end

  def test_it_knows_when_guess_is_4_chars
    result = Mastermind.new
    result = result.check_guess_for_format("1234")

    assert_equal "1234", result
  end

  def test_it_makes_random_color_combos_on_easy
    result = Mastermind.new
    result.computer.easy_mode
    colors1 = result.computer.code_combination
    result.computer.easy_mode
    colors2 = result.computer.code_combination

    refute colors1 == colors2
  end

  def test_it_can_select_a_five_color_code_on_medium
    result = Mastermind.new
    result.computer.medium_mode
    
    assert_equal Array, result.computer.colors.class
    assert_equal 5, result.computer.colors.length
  end

   def test_it_makes_random_color_combos_on_medium
    result = Mastermind.new
    result.computer.medium_mode
    colors1 = result.computer.code_combination
    result.computer.medium_mode
    colors2 = result.computer.code_combination

    refute colors1 == colors2
  end

  def test_it_can_select_a_six_color_code_on_hard
    result = Mastermind.new
    result.computer.hard_mode
    
    assert_equal Array, result.computer.colors.class
    assert_equal 6, result.computer.colors.length
  end

    def test_it_makes_random_color_combos_on_mard
    result = Mastermind.new
    result.computer.hard_mode
    colors1 = result.computer.code_combination
    result.computer.hard_mode
    colors2 = result.computer.code_combination

    refute colors1 == colors2
  end
    
end