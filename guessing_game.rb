class GuessingGame
  attr_reader :remaining_guesses
  attr_accessor :congrats_message

  def initialize(secret_number, allowed_guesses)
    @secret_number = secret_number
    @allowed_guesses = allowed_guesses
    @congrats_message = "Yay, you won!"
    @lost_message = "You lost!"
    @remaining_guesses = allowed_guesses
    @status = ""
    @history = []
    @optional_response = ""
    @game_over = false
    @answer = " The number was #{@secret_number}"
  end

  def has_won?
    # if game over is true and guessed number == secret number
    #return true
    if @game_over && @history.include?(@secret_number)
      @status = "You already won."
      true
    else
      false
    end
  end

  def has_lost?
    # if game over is true and history does not include the secret number
    # return true
    if @game_over && !@history.include?(@secret_number)
      @status = "You already lost."
      true
    else
      false
    end
  end

  def guess(guessed_number)
    return game_over_warning if @game_over
    @remaining_guesses -= 1 unless @history.include?(guessed_number)
    @optional_response = check_remaining_guesses

    if guessed_number < @secret_number
      @history << guessed_number
      response = "Too low!" + @optional_response
    elsif guessed_number > @secret_number
      @history << guessed_number
      response = "Too high!" + @optional_response
    elsif guessed_number == @secret_number
      @history << guessed_number
      @game_over = true
      return @congrats_message + @answer
    end

    if @remaining_guesses == 0
      @game_over = true
      @lost_message + @answer
    else
      response
    end
  end

  def check_remaining_guesses
    if @remaining_guesses == 1
      @optional_response = " WARNING: Only one guess left!"
    else
      @optional_response = ""
    end
  end

  def game_over_warning
    if @game_over && has_lost?
      @status + @answer
    elsif @game_over && has_won?
      @status + @answer
    end
  end
end
