require './lib/user'
require './lib/computer'
require './lib/game_settings'
require './lib/text'
require 'pry'

class Mastermind
  include Text 
  include GameSettings

  COLORS = ["R","G","B","Y","O","W"]

  attr_reader :user,        :standing,
              :guess_count, :computer,
              :start,       :finish
              
  def initialize
    @user = User.new(self)
    @computer = Computer.new
  end

  def guess_tracking
    @guess_count += 1
    guess_message
  end

  def win
    win_message
    calculate_time
  end

  def verify_guess(current_guess)
    @standing = evaluate_guess(current_guess)
    if current_guess[0] == "C"
      puts "Psst.. the code is #{computer.code_combination.join}"        
    elsif standing[:exact].length == 4
      guess_tracking
      win
      play_again?
    else
      guess_tracking
      puts "You guessed \e[32m#{current_guess.join}\e[0m"
    end
  end
  
  def play_game
    @start = Time.now
    @guess_count = 0
    25.times do |try|
      puts "This is chance \e[31m#{try + 1}\e[0m of 25"
      puts "What is your guess? Choose one of the following: #{computer.colors.join(', ')}"
      guess = check_guess_for_format(user.get_guess)
      verify_guess(guess)
    end
    puts "You lost!"
    calculate_time
    play_again?
  end

  def evaluate_guess(current_guess)
    results = { :exact => [], :close => [] }
    current_guess.each_with_index do |input, position|
      if exact_match?(input, position)
        results[:exact] << true
      elsif close_match?(input)
        results[:close] << true
      end
    end
    results
  end
end

