require "card"
class Deck
    attr_accessor :cards
    
    def self.create_deck
        cards = []
        4.times do |suit_num|
            13.times do |val_num|
                cards << Card.new(suit_num, val_num)
            end
        end
        cards.pop
        cards.push(Card.new(5,5))
        Deck.new(cards)
    end

    def initialize(cards)
        @cards = cards
    end

    def shuffle
        new_cards = []
        [0..51].shuffle.each do |idx|
            new_cards << cards[idx]
        end
        cards = new_cards
    end
end