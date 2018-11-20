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
        shuffled_cards = []
        (0..51).to_a.shuffle.each do |idx|
            shuffled_cards << cards[idx]
        end
        cards = shuffled_cards
    end
    
    def deal_card
      cards.shift
    end

    def return_card(card)
      raise ArgumentError, "Only cards can be returned to deck" unless card.is_a? Card
      cards.push(card)
    end
end