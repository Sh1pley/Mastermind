module UserOperations

  def start_game
    options
    input = get_guess
    if input[0] == "P"
      @mastermind.play_game
    elsif input[0] == "I"
      instructions
      start_game
    else
      puts "Oops, not recognized"
      start_game
    end
  end

  def check_for_clear(input)
    if input.upcase == "CLEAR"
      system 'clear'
      input
    else
      input
    end
  end

  def difficulty
    choose_difficulty
    input = get_guess
    if input[0] == "E"
      easy
      start_game
    elsif input[0] == "M"
      medium
      start_game
    elsif input[0] == "H"
      hard
      start_game
    end
  end

  def easy
    mastermind.easy_start
  end

  def medium
    mastermind.medium_start
  end

  def hard
    mastermind.hard_start
  end
end