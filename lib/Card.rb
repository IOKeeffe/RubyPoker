class Card
    SUIT_SYMBOLS = ["\u2664", "\u2661", "\u2662", "\u2667"]
    SUITS = ["Spades", "Hearts", "Diamonds", "Clubs"]
    VALUE_SYMBOLS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

    attr_accessor :suit, :value

    def self.compare(card1, card2)
        return nil if card1.value == card2.value
        card1.value > card2.value ? card1 : card2
    end

    def initialize(suit_number, value)
        @suit = SUIT_SYMBOLS[suit_number]
        @value = VALUE_SYMBOLS[value]
    end

    def to_s
        "#{suit} #{value}"
    end
end