class PlayerScore

  attr_reader :score

  def initialize
    @score = 0
  end

  def won_point
    @score += 1
  end

  def deuce? opponent
    @score >= 3 && @score == opponent.score
  end

  def has_advantage? opponent
    @score - opponent.score == 1 && @score >= 4
  end

  def winner? opponent
    @score >= 4 && (@score - opponent.score) >= 2
  end

end