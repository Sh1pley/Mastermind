require './lib/text'
require './lib/user_operations'
require 'pry'

class User
  include Text
  include UserOperations

  attr_reader :mastermind

  def initialize(parent = nil)
    @mastermind = parent
  end

  def start
    difficulty
  end

  def get_guess
    converted_guess(check_for_clear(gets.chomp))
  end

  def converted_guess(guess)
    if guess.upcase == "Q"
      exit
    else
      guess.upcase.split('')
    end
  end

end