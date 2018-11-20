require "game"
describe Game do

  # TODO: Offload this into the hand class. Hand should judge it's own rank.
  # Hand should have a #value method that returns a hash of rank and highest cards

  let(:game) { Game.new }
  let(:ace_of_hearts) { double("card", suit: :hearts, value: "a") }
  let(:king_of_hearts) { double("card", suit: :hearts, value: "k") }
  let(:queen_of_hearts) { double("card", suit: :hearts, value: "q") }
  let(:jack_of_hearts) { double("card", suit: :hearts, value:"j") }
  let(:ten_of_hearts) { double("card", suit: :hearts, value:"10") }
  let(:nine_of_hearts) { double("card", suit: :hearts, value:"9") }
  let(:ten_of_diamonds) { double("card", suit: :diamonds, value:"10") }
  let(:nine_of_diamonds) { double("card", suit: :diamonds, value:"9") }
  let(:nine_of_spades) { double("card", suit: :spades, value:"9") }
  let(:nine_of_clubs) { double("card", suit: :clubs, value:"9") }

  it ""
  describe "#judge_winner" do 
    it "judges a winning hand" do
      winning_hand = double("hand", rank: :flush)
      losing_hand = double("hand", rank: :pair)
      expect(game.judge_winner(winning_hand, losing_hand)).to eq(winning_hand)
    end

    it "raises an error when the wrong objects are passed" do
      expect(game.judge_winner("bad", "argument")).to raise_error(ArgumentError)
    end
    
    it "picks a winner based on highest card if hands are tied" do
      winning_hand = double("hand", rank: :flush, high_card: 11)
      losing_hand = double("hand", rank: :flush, high_card: 10)

      expect(game.judge_winner(winning_hand, losing_hand)).to eq(winning_hand)
    end
  end

end