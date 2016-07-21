require_relative '../guessing_game'

describe "GuessingGame" do
  let(:game) { GuessingGame.new(8, 5) }
  let(:losing_game) { GuessingGame.new(999, 1) }
  let(:winning_game) { GuessingGame.new(100, 2) }

    it "can be initialized with a custom 'secret number'" do
      expect(game.secret_num).to eq 8
      expect(losing_game.secret_num).to eq 999
    end

    it "can have a custom congrats message" do
    end

    it "will have 5 remaining guesses in game 1" do
    end

    it "will have 1 remaining guess in game 2" do
    end

    it "knows a user has not won or lost" do
    end

    it "provides correct feedback after incorrect guess" do
    end

    it "deducts from remaining guesses for wrong guess" do
    end

    it "does not deduct from remaining guesses for repeated guesses" do
    end

    it "provides different feedback if the guess is too high" do
    end

    it "displays a warning when 1 guess remains" do
    end

    it "displays custom message when guess is correct" do
    end

    it "displays a message when user loses" do
    end

    it "tells user game is over if they keep guessing" do
    end

    it "does not alter remaining guesses if game over" do
    end

    it "records won game correctly" do
    end

    it "records lost game correctly" do
    end

end
