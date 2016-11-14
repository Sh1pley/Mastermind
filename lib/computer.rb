class Computer
  attr_reader :code_combination,
              :colors           

  def easy_mode
    @colors = Mastermind::COLORS.take(4)
    @code_combination = code(4)
  end

  def medium_mode
    @colors = Mastermind::COLORS.take(5)
    @code_combination = code(6)
  end

  def hard_mode
    @colors = Mastermind::COLORS.take(6)
    @code_combination = code(8)
  end

  def code(num)
    secret_code = []
    num.times{ secret_code << ((colors * 2).shuffle).pop}
    secret_code
  end
end