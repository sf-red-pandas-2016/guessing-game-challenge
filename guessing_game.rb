class GuessingGame
  attr_reader :secret_number, :allowed_guesses, :remaining_guesses
  attr_accessor :congrats_message

  def initialize(secret_number, allowed_guesses)
    @secret_number = secret_number
    @remaining_guesses = @allowed_guesses = allowed_guesses
    @congrats_message = "Yay, you won!"
    @guesses = []
    @winner = false
  end

  def has_won?
    @winner
    # false
  end

  def has_lost?
      false
  end

  def guess(number)
    if number != @secret_number && first_time_guessing(number)
      @remaining_guesses -= 1
    end

    @guesses << number
    stop_playing(@guesses)
    if number < @secret_number && @remaining_guesses != 0
      "Too low!"
    elsif warning &&  number != @secret_number
      "Too high! WARNING: Only one guess left!"
    elsif number > @secret_number && @remaining_guesses != 0
      "Too high!"
    elsif @remaining_guesses == 0 && number != @secret_number
      "You lost! The number was #{@secret_number}"
    elsif number == @secret_number && @remaining_guesses > 0 #&&
      @winner = true
      @congrats_message + " The number was #{number}"
    elsif @winner == true && @remaining_guesses == 0
      # A winner has been declared AND no remaining guesses
      "You already won. The number was #{@secret_number}"
    end
  end

  private
  def first_time_guessing(num)
    !@guesses.include?(num)
  end

  def warning
    if @remaining_guesses == 1
      true
    end
  end

  def stop_playing(array_of_guesses)
    # if they've already won AND they keep guessing
    if @winner == true && @allowed_guesses > array_of_guesses.length
      "You already won. The number was #{@secret_number}"
    end
  end
end


# things to look up .dump and .load
# instances of GuessingGame
# winning_game
# game
# losing_game
# copied_game
