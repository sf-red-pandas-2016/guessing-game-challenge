require_relative 'guessing_game'

puts "We can initialize a guessing game with our desired 'secret number' and the number of allowed guesses"
game = GuessingGame.new(8, 5) # game 1
losing_game = GuessingGame.new(999, 1) # game 2
winning_game = GuessingGame.new(100, 2) # game 3

puts "We can set a custom congrats message"
p (game.congrats_message == "Yay, you won!")
game.congrats_message = "Correct!"
p (game.congrats_message == "Correct!")

puts "There will be 5 guesses remaining in game 1"
p (game.remaining_guesses == 5)

puts "There will be 1 guess remaining in game 2"
p (losing_game.remaining_guesses == 1)

puts "User has neither won nor lost yet"
p (game.has_won? == false)
p (game.has_lost? == false)

puts "Wrong guess receives correct feedback"
p (game.guess(2) == "Too low!")

puts "Wrong guess deducts from remaining guesses"
p (game.remaining_guesses == 4)

puts "Repeated guesses do not cost the user anything"
p (game.guess(2) == "Too low!")
p (game.remaining_guesses == 4)

puts "Wrong guess receives feedback"
p (game.guess(11) == "Too high!")

puts "Wrong guess deducts from remaining guesses"
p (game.remaining_guesses == 3)

p (game.guess(10) == "Too high!")
p (game.remaining_guesses == 2)

puts "Warning is given when there's only one guess remaining"
p (game.guess(9) == "Too high! WARNING: Only one guess left!")

puts "Repeated guess when 1 guess is remaining should have warning"
p (game.guess(9) == "Too high! WARNING: Only one guess left!")

# make deep copy of game 1 to test losing
copied_game = Marshal.load(Marshal.dump(game))

puts "Correct guess gets feedback for the custom congrats message"
p (game.guess(8) == "Correct! The number was 8")
p (winning_game.guess(100) == "Yay, you won! The number was 100")

puts "Losing games get a loss message"
p (losing_game.guess(9) == "You lost! The number was 999")
p (copied_game.guess(123) == "You lost! The number was 8")

puts "Guesses on completed games show the status of the game"
p (game.guess(8) == "You already won. The number was 8")
p (game.guess(9) == "You already won. The number was 8")
p (winning_game.guess(0) == "You already won. The number was 100")
p (losing_game.guess(999) == "You already lost. The number was 999")
p (losing_game.guess(111) == "You already lost. The number was 999")

puts "Guesses on completed games do not alter remaining_guesses"
p (game.remaining_guesses == 0)
p (winning_game.remaining_guesses == 1)
p (losing_game.remaining_guesses == 0)

puts "Outcome is recorded correctly for won game"
p (game.has_won? == true)
p (game.has_lost? == false)

puts "Outcome is recorded correctly for lost game"
p (losing_game.has_won? == false)
p (losing_game.has_lost? == true)

# OTHER TEST CODE
# agame = GuessingGame.new(5,2)
# p agame.remaining_guesses
# p agame.guess(6)
# p agame.remaining_guesses
# p agame.guess(4)
# p agame.remaining_guesses
# p agame.guess(8)
# p agame.remaining_guesses
