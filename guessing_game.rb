
class GuessingGame
  attr_accessor :congrats_message, :game_won, :game_lost

  def initialize(secret_number, allowed_guesses)
    @secret_number = secret_number
    @allowed_guesses = allowed_guesses
    @congrats_message = "Yay, you won!"
    @guesses = []
    @game_won = false
    @game_lost = false

  end

  def remaining_guesses
    @allowed_guesses - @guesses.uniq.length #number of guesses
  end

  def has_won?
    @game_won
  end

  def has_lost?
    @game_lost
  end

  def guess(player_guess)
    @guesses << player_guess
    message = ""
    if player_guess == @secret_number
      if @game_won
        message = "You already won. The number was #{@secret_number}"
      else
        message = @congrats_message + " The number was #{@secret_number}"
        @game_won = true
      end
    else
      if @game_lost
        message = "You already lost. The number was #{@secret_number}"
      else
        if player_guess < @secret_number
          message = "Too low!"
        else
          message = "Too high!"
        end

        if remaining_guesses == 1
          message += " WARNING: Only one guess left!"
        elsif remaining_guesses == 0
          message += "You lost! The number was #{@secret_number}"
        else
        " asd ads as "
        end

      end
    end
  end


      # # # # # # # # # # # # # # # # # # # # # # # # #

    # if has_won?
    #   "You already won. The number was #{@secret_number}"
    #   # @game_won = true
    # elsif has_lost? #remaining_guesses == 0
    #   "You already lost. The number was #{@secret_number}"
    # else
    #   @guesses << player_guess
    #   if player_guess == @secret_number
    #     @game_won = true
    #     @congrats_message + " The number was #{@secret_number}"
    #   else
    #     if remaining_guesses == 0
    #       "You lost! The number was #{@secret_number}"
    #       @game_lost = true
    #     else
    #       if remaining_guesses == 1
    #         "Too high! WARNING: Only one guess left!"
    #       else
    #         player_guess < @secret_number ? "Too low!" : "Too high!"
    #       end
    #     end
    #   end
    # end

end
