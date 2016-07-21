# require 'pry'

class GuessingGame
  attr_reader :remaining_guesses
  attr_accessor :congrats_message

  def initialize(secret_number, allowed_guesses)
    @secret_number = secret_number
    @congrats_message = "Yay, you won!"
    @lost_message = "You lost!"
    @remaining_guesses = allowed_guesses
    @status = ""
    @history = []
    @optional_response = ""
    @game_over = false
    @answer = " The number was #{@secret_number}"
  end

  # initialize methods should be lean and not prone to bugs
  # create a #messages method

  def has_won?
    if @game_over && @history.include?(@secret_number)
      @status = "You already won."
      true
    else
      false
    end
  end

  def has_lost?
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
    check_remaining_guesses

    # binding.pry
    @history << guessed_number

    case guessed_number <=> @secret_number
    when -1
      response = "Too low!" + @optional_response
    when 0
      @game_over = true
      response = "Correct! The number was 8"
    when 1
      response = "Too high!" + @optional_response
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
      @optional_response = ''
    end
  end

  def game_over_warning
    return if @game_over
    @status + @answer
  end
end


