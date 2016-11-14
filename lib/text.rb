# require './lib/mastermind'

module Text

  def instructions
    puts "The chosen pattern is #{mastermind.computer.colors.length},"
    puts "made up of #{mastermind.computer.colors.join(', ')};"
    puts "created by the codemaker(computer), not visible to the codebreaker."
    puts "The codebreaker tries to guess the pattern, in both order and color."
    puts "Each guess is made by typing a 4 selection combo of the colors in any order"
    puts "..........................................................................."
    puts "==========================================================================="
  end

  def cheat
    puts "\e[33mPsst.. the code is #{computer.code_combination.join}\e[0m"
  end

  def time
    puts "\e[35mTotal time played was #{@minutes} minutes, and #{@seconds} seconds!\e[0m"
    puts "==========================================================="
  end

  def win_message
    puts "\e[1;36mCongratulations!\e[0m You won in #{@guess_count} guesses!"
    puts "===================================================="
  end

  def welcome_easy
    puts "I have generated a beginner sequence with four elements made up of:"
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow."
    puts "Lets Begin!.....>" 
  end


  def welcome_medium
    puts "I have generated a beginner sequence with 6 elements made up of:"
    puts "(r)ed, (g)reen, (b)lue, (y)ellow, (w)hite, and (o)range."
    puts "Lets Begin!.....>" 
  end

  def welcome_hard
    puts "I have generated a beginner sequence with 8 elements made up of:"
    puts "(r)ed, (g)reen, (b)lue, (y)ellow, (o)range, and (w)hite."
    puts "Lets Begin!.....>" 
  end

  def options
    puts "Would you like to (P)lay or read the (I)nstructions?"
    puts "Use (Q)uit at any time to end the game."
    puts "===================================================================="
  end

  def choose_difficulty
    puts "Would you like to play (E)asy, (M)edium, or (H)ard mode?"
  end

  def guess_message
    puts "#{@standing[:exact].length} Exact Color and Position Matches"
    puts "#{@standing[:close].length} Correct Color Matches"
    puts "============================================================"
  end
end
