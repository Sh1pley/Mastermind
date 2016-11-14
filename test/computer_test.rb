require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_exists
    assert Computer.new
  end

  def test_it_retrieves_color_combos
    result = Computer.new
    result.easy_mode

    assert_equal (["R", "G", "B", "Y"]), result.colors
  end

  def test_it_creates_new_combo_from_set_easy
    result = Computer.new
    result.easy_mode

    assert_equal (["R", "G", "B", "Y"]), result.colors
    refute result.colors == result.code_combination
  end

  def test_it_creates_new_combo_from_set_medium
    result = Computer.new
    result.medium_mode

    assert_equal (["R", "G", "B", "Y", "O"]), result.colors
    refute result.colors == result.code_combination
  end

  def test_it_creates_new_combo_from_set_hard
    result = Computer.new
    result.hard_mode

    assert_equal (["R", "G", "B", "Y", "O", "W"]), result.colors
    refute result.colors == result.code_combination
  end
end