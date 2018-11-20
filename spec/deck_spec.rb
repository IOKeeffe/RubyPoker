require "rspec"
require "deck"
require "pry"
require "set"
require "card"

describe Deck do
  let(:deck) { Deck.create_deck }
  let(:cards) { deck.cards }

  describe "::create_deck" do
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

  describe "#shuffle" do
    it 'shuffles' do 
      expect(deck.shuffle.length).to eq(52)
      sorted_cards = Deck.create_deck.cards
      expect(sorted_cards[0] != cards[0] &&
            sorted_cards[1] != cards[1] &&
            sorted_cards[2] != cards[2]).to be_truthy
    end

    it "doesn't alter the structure of the deck's cards" do
      deck.shuffle
      expect(deck.cards).to be_instance_of Array
      expect(deck.cards.all? { |card| card.is_a? Card }).to be_truthy
    end
  end

  describe "#deal_card" do
    it "removes a card from the deck" do
      deck.deal_card
      expect(cards.length).to eq(51)
    end

    it "returns a card" do
      card = deck.deal_card
      expect(card).to be_instance_of(Card)
    end

    it "deals the first card" do
      first_card = cards[0]
      dealt_card = deck.deal_card
      expect(dealt_card).to eq(first_card)
    end
  end

  describe "#return_card" do
    it "adds a card back to the deck" do
      removed_card = cards.pop
      deck.return_card(removed_card)
      expect(cards.length).to eq(52)
    end

    it "won't add non-card objects" do
      cards.pop
      expect {deck.return_card("fake_card")}.to raise_error(ArgumentError)
      expect(cards.length).to eq(51)
    end
  end
end