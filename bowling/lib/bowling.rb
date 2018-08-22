class Bowling
  attr_reader :rolls

  def initialize(rolls)
    @rolls = rolls
  end

  def score
    sum_of_frames
  end

  def sum_of_frames(running_score = 0, remaining_rolls = rolls.dup,
                    current_frame = 0, max_frames = 10)

    current_frame += 1
    if current_frame > max_frames ||          # stop if game over
      (((remaining_rolls.take(1).sum) == 10) or ((remaining_rolls.take(2).sum) == 10) and
          remaining_rolls.size < 3) ||        # stop if strike or spare needs more rolls
      (remaining_rolls.size < 2)              # stop if frame needs more rolls
      return running_score
    end

    # strike
    if remaining_rolls.size > 2 and (remaining_rolls.take(1).sum) == 10
      running_score += remaining_rolls[0] + remaining_rolls[1] + remaining_rolls[2]
      return sum_of_frames(running_score, remaining_rolls.drop(1), current_frame)
    end

    # spare
    if remaining_rolls.size > 2 and (remaining_rolls.take(2).sum) == 10
      running_score += remaining_rolls[0] + remaining_rolls[1] + remaining_rolls[2]
      return sum_of_frames(running_score, remaining_rolls.drop(2), current_frame)
    end

    # open frame
    if remaining_rolls.size > 1
      running_score += remaining_rolls[0] + remaining_rolls[1]
      return sum_of_frames(running_score, remaining_rolls.drop(2), current_frame)
    end
  end
end
