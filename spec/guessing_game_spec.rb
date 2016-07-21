require_relative '../guessing_game'

describe "GuessingGame" do
  let(:game) { GuessingGame.new(8, 5) }
  let(:losing_game) { GuessingGame.new(999, 1) }
  let(:winning_game) { GuessingGame.new(100, 2) }

    it "can be initialized with a custom 'secret number'" do
      expect(game.secret_num).to eq 8
      expect(losing_game.secret_num).to eq 999
      expect(winning_game.secret_num).to eq 100
    end

    it "can have a custom congrats message" do
      expect(game.congrats_message).to eq "Yay, you won!"
      game.congrats_message = "Correct!"
      expect(game.congrats_message).to eq "Correct!"
    end

    it "will have 5 remaining guesses in game 1" do
      expect(game.remaining_guesses).to eq 5
    end

    it "will have 1 remaining guess in game 2" do
      expect(losing_game.remaining_guesses).to eq 1
    end

    it "knows a user has not won or lost" do
      expect(game.has_won?).to eq false
      expect(game.has_lost?).to eq false
    end

    it "provides correct feedback after incorrect guess" do
      expect(game.guess(2)).to eq "Too low!"
    end

    it "deducts from remaining guesses for wrong guess" do
      game.guess(2)
      expect(game.remaining_guesses).to eq 4
    end

    it "does not deduct from remaining guesses for repeated guesses" do
      game.guess(2)
      game.guess(2)
      expect(game.remaining_guesses).to eq 4
    end

    it "provides different feedback if the guess is too high" do
      expect(game.guess(11)).to eq "Too high!"
    end

    it "displays a warning when 1 guess remains" do
      expect(winning_game.guess(5)).to eq "Too low! WARNING: Only one guess left!"
    end

    it "displays custom message when guess is correct" do
      game.congrats_message = "Correct!"
      expect(game.guess(8)).to eq "Correct! The number was 8"
    end

    it "displays a message when user loses" do
      expect(losing_game.guess(1)).to eq "You lost! The number was 999"
    end

    it "tells user game is over if they keep guessing" do
      losing_game.guess(1)
      expect(losing_game.guess(5)).to eq "You already lost. The number was 999"
      winning_game.guess(100)
      expect(winning_game.guess(5)).to eq "You already won. The number was 100"
    end

    it "does not alter remaining guesses if game over" do
      losing_game.guess(1)
      losing_game.guess(5)
      expect(losing_game.remaining_guesses).to eq 0
    end

    it "records won game correctly" do
      game.guess(8)
      expect(game.has_won?).to eq true
    end

    it "records lost game correctly" do
      losing_game.guess(5)
      expect(losing_game.has_lost?).to eq true
    end

end
