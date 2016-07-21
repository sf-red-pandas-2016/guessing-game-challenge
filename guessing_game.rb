class GuessingGame
  attr_reader :secret_number, :allowed_guesses, :remaining_guesses
  attr_accessor :congrats_message

  def initialize(secret_number, allowed_guesses)
    @secret_number = secret_number
    @remaining_guesses = @allowed_guesses = allowed_guesses
    @congrats_message = "Yay, you won!"
    @guesses = []
  end

  # def remaining_guesses
  #   remaining = @allowed_guesses

  #   until has_lost?
  #   remaining = @allowed_guesses -= 1
  #   end
  #   # p allowed_guesses
  #   return remaining
  # end

  def has_won?
    false
  end

  def has_lost?
    # remaining_guesses = 0 && (@number != secret_number)
    false
  end

  def guess(number)

    if number != @secret_number && first_time_guessing(number)
      @remaining_guesses -= 1
    end

    @guesses << number

    "Too low!"
    # while remaining_guesses <= allowed_guesses
    #   if @number == secret_number
    #     #true
    #     has_won?
    #   else
    #     remaining_guesses #  = @allowed_guesses - 1
    #   end
    # end
  end

  private
  def first_time_guessing(num)
    !@guesses.include?(num)
  end
end

# things to look up .dump and .load
# instances of GuessingGame
# winning_game
# game
# losing_game
# copied_game
