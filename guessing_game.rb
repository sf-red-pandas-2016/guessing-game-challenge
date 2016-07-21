class GuessingGame

  attr_reader :num_guesses, :secret_num
  attr_accessor :congrats_message

  def initialize(secret_num, num_guesses)
    @secret_num = secret_num
    @num_guesses = num_guesses
    @congrats_message = "Yay, you won!"
    @guesses_made = []
    @won = false
    @lost = true
  end

  def remaining_guesses
    return @num_guesses
  end

  def has_won?
    @won
  end

  def has_lost?
    return false if @won
    @num_guesses == 0
  end

  def guess(guessed_num)
    return "You already won. The number was #{@secret_num}" if has_won?
    return "You already lost. The number was #{@secret_num}" if has_lost?
    if guessed_num == @secret_num
      @won = true
      @num_guesses -= 1 if @num_guesses > 0
      return @congrats_message + " The number was #{@secret_num}"
    end
    unless guessed_num == @secret_num
      response = ""
      if @guesses_made.include?(guessed_num)
        if guessed_num < @secret_num
          response += "Too low!"
          # @num_guesses -= 1
        else
          response += "Too high!"
          # @num_guesses -= 1
        end
      else
        if guessed_num < @secret_num
          response += "Too low!"
          @num_guesses -= 1 if @num_guesses > 0
        else
          response += "Too high!"
          @num_guesses -= 1 if @num_guesses > 0
        end
      end
      @guesses_made << guessed_num
      if @num_guesses > 1
        return response
      elsif @num_guesses == 1
        response += " WARNING: Only one guess left!"
        return response
      else
        #@lost = false
        "You lost! The number was #{@secret_num}"
      end
    end
  end

end
