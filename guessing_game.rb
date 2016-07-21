require 'pry-byebug'

class GuessingGame

  attr_accessor :congrats_message, :remaining_guesses, :secret_number

  def initialize(secret_number, allowed_guesses)
    @secret_number = secret_number
    @remaining_guesses = allowed_guesses
    @congrats_message = "Yay, you won!"
    @guess = 0
    @guessed_numbers = []
    @won_game = false
  end

def has_won?
  return true if @won_game == true
  return false
end

def has_lost?
  return true if @remaining_guesses <= 0 && @won_game == false
  return false
end

def guess(number)

  #stop here if the game is over
  return "You already won. The number was #{@secret_number}" if has_won?
  return "You already lost. The number was #{@secret_number}" if has_lost?

  if number > @secret_number
    @remaining_guesses -= 1 if !@guessed_numbers.include?(number)
    @guessed_numbers << number
    return "You lost! The number was #{@secret_number}" if @remaining_guesses == 0
    return "Too high! WARNING: Only one guess left!" if @remaining_guesses == 1
    p "Too high!"
  elsif number < @secret_number
    @remaining_guesses -= 1 if !@guessed_numbers.include?(number)
    @guessed_numbers << number
    return "You lost! The number was #{@secret_number}" if @remaining_guesses == 0
    return "Too low! WARNING: Only one guess left!" if @remaining_guesses == 1
    p "Too low!"
  elsif number == @secret_number
    @remaining_guesses -= 1
    @won_game = true
    p @congrats_message + " The number was #{@secret_number}"
  end

end


end
