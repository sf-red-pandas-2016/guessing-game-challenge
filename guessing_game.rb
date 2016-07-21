
class GuessingGame
  attr_accessor :congrats_message

  def initialize(secret_number, allowed_guesses)
    @secret_number = secret_number
    @allowed_guesses = allowed_guesses
    @congrats_message = "Yay, you won!"
    @guesses = []
  end

  def remaining_guesses
    @allowed_guesses - @guesses.uniq.length #number of guesses
  end

  def has_won?
    guess(player_guess) == @secret_number
  end

  def has_lost?
    @allowed_guesses == 0
  end

  def guess(player_guess)
    @guesses << player_guess

      if remaining_guesses == 1
        "Too high! WARNING: Only one guess left!"
      else
        player_guess < @secret_number ? "Too low!" : "Too high!"
      end

    # @guesses << player_guess
    # player_guess
  end

end
