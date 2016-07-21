require 'pry'
class GuessingGame
  attr_accessor :congrats_message
  attr_reader :remaining_guesses, :secret_number

  def initialize(secret_number, number_guesses)
    @secret_number = secret_number
    @number_guesses = number_guesses
    @remaining_guesses = number_guesses
    @congrats_message = "Yay, you won!"
    @num_guessed_arr = []
    @loss_message = "You lost! The number was #{secret_number}"
  end

  def guess(number)
    if remaining_guesses == 2
      if number > secret_number
        "Too high! WARNING: Only one guess left!"
        if !@num_guessed_arr.include?(number) then @remaining_guesses -= 1
        end
        @num_guessed_arr << number
      elsif
        number < secret_number
        if !@num_guessed_arr.include?(number) then @remaining_guesses -= 1
        end
        @num_guessed_arr << number
        "Too low! WARNING: Only one guess left!"
      else
        if !@num_guessed_arr.include?(number) then @remaining_guesses -= 1
        end
        @num_guessed_arr << number
        @congrats_message
      end

    elsif remaining_guesses > 0
      if number > secret_number
        if !@num_guessed_arr.include?(number) then @remaining_guesses -= 1
        end
        @num_guessed_arr << number
        "Too high!"
      elsif
        number < secret_number
        if !@num_guessed_arr.include?(number) then @remaining_guesses -= 1
        end
        @num_guessed_arr << number
        "Too low!"
      else
        if !@num_guessed_arr.include?(number) then @remaining_guesses -= 1
        end
        @num_guessed_arr << number
        @congrats_message
      end

    else
      if has_won?
        p "You already won. The number was #{secret_number}"
      else
        p "You already lost. The number was #{secret_number}"
      end
    end
  end

  def has_won?
    @num_guessed_arr.include?(@secret_number)
  end

  def has_lost?
    if !@num_guessed_arr.include?(@secret_number) && remaining_guesses == 0
      puts @loss_message
      return true
    else
      return false
    end
  end


end
