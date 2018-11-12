require "rspec"
require "deck"
require "pry"
require "set"

describe Deck do
    let(:deck) { Deck.create_deck }
    let(:cards) { deck.cards }

    describe "#create_deck" do
        before do
        end
        it "returns a Deck object" do
            expect(deck).to be_instance_of(Deck)
        end

        it "contains 52 cards" do
            expect(cards.length).to eq(52)
        end

        it "contains no duplicates" do
            card_set = Set.new
            
            cards.each do |card|
                card_set.add(card.to_s)
            end
            
            expect(card_set.length).to eq(cards.length)
        end
    end
end