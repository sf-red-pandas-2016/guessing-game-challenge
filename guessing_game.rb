
class GuessingGame
  attr_accessor :congrats_message, :game_status

  def initialize(secret_number, allowed_guesses)
    @secret_number = secret_number
    @allowed_guesses = allowed_guesses
    @congrats_message = "Yay, you won!"
    @guesses = []
    @game_status = false

  end

  def remaining_guesses
    @allowed_guesses - @guesses.uniq.length #number of guesses
  end

  def has_won?
    @game_status
  end

  def has_lost?
    @game_lost
  end

  def guess(player_guess)
    if has_won?
      "You already won. The number was #{@secret_number}"
    elsif remaining_guesses == 0
      "You already lost. The number was #{@secret_number}"
      @game_lost = true
    else

      @guesses << player_guess

      if player_guess == @secret_number
        @game_status = true
        @congrats_message + " The number was #{@secret_number}"
      else
        if has_lost?
          "You lost! The number was #{@secret_number}"
        else
          if remaining_guesses == 1
            "Too high! WARNING: Only one guess left!"
          else
            player_guess < @secret_number ? "Too low!" : "Too high!"
          end
        end
      end
    end


    # add the guess to the array
    # if player_guess == @secret_number
    #   use has_won to check if the user has won
    #   return congrats message

    # elsif player_guess != secret_number
    #   too high
    #   too low




  end

end
