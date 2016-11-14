module GameSettings

  def close_match?(input)
    computer.code_combination.include?(input)
  end

  def exact_match?(input, position)
    input == computer.code_combination[position]
  end

  def play_again?
    puts "Play again? (Y)es, or (N)o?"
    answer = user.get_guess
    if answer[0] == "Y"
      Mastermind.new.user.start
    else
      puts "Maybe next time?!"
      exit
    end
  end

  def calculate_time
    @finish = Time.new
    total = finish - start.round(2)
    @minutes = Time.at(total).utc.strftime("%M")
    @seconds = Time.at(total).utc.strftime("%S")
    time
  end

  def check_guess_for_format(guess)
    if guess.length > 8
      puts "\e[1;33mToo many, guess should be 4!\e[0m"
      user.converted_guess("...")
    elsif guess.length < 4
      puts "\e[1;33mNot enough, guess should be 4!\e[0m"
      user.converted_guess("...")
    else
      guess
    end
  end

  def verify_guess(current_guess)
    @standing = evaluate_guess(current_guess)
    if current_guess[0] == "C"
      cheat
    elsif current_guess == computer.code_combination
      guess_tracking
      win
      play_again?
    else
      guess_tracking
      puts "You guessed \e[32m#{current_guess.join}\e[0m"
    end
  end

   def easy_start
    computer.easy_mode
    welcome_easy
    play_game
  end

  def medium_start
    computer.medium_mode
    welcome_medium
    play_game
  end

  def hard_start
    computer.hard_mode
    welcome_hard
    play_game
  end
end