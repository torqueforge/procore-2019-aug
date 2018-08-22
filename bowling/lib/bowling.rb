class Bowling
  attr_reader :rolls

  def initialize(rolls)
    @rolls = rolls
  end

  def score
    sum_of_frames
    rolls.sum
  end

  def sum_of_frames(running_score = 0, remaining_rolls = rolls.dup)
    if remaining_rolls.size > 2 and (remaining_rolls.take(2).sum) == 10
      running_score += remaining_rolls[0] + remaining_rolls[1] + remaining_rolls[2]
      return sum_of_frames(running_score, remaining_rolls.drop(2))
    end

    if remaining_rolls.size > 1
      running_score += remaining_rolls[0] + remaining_rolls[1]
      if remaining_rolls.drop(2).empty?
        running_score
      else
        return sum_of_frames(running_score, remaining_rolls.drop(2))
      end
    end
  end
end
