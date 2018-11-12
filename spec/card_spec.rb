require "rspec"
require "card"

describe Card do 
    let(:card) { Card.new(0, 4) }
    let(:equal_card) { Card.new(1, 4) }
    let(:low_card) { Card.new(0, 0) }

    describe "#initialize" do
        it "Has a suit and a value" do
            expect(card.suit).to eq("\u2664")
            expect(card.value).to eq("6")
        end
    end
    describe "#to_s" do
        it "returns the card's suit and value as a single string" do
            expect(card.to_s).to eq("\u2664 6")
        end
    end
    describe "Card#compare" do
        it "returns the higher valued of two cards" do
            expect(Card.compare(card, low_card)).to be(card)
        end

        it "returns nil for two equal cards" do 
            expect(Card.compare(card, equal_card)).to be_nil
        end
    end
end