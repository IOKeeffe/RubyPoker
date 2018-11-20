class Game
  RANKS = {
    royal_flush: 9,
    straight_flush: 8,
    four_of_a_kind: 7,
    full_house: 6,
    flush: 5,
    straight: 4,
    three_of_a_kind: 3,
    two_pair: 2,
    pair: 1,
    high_card: 0
  }
  def self.create_game(options)

  end

  def judge_winner(hand_1, hand_2)
    debugger
    raise ArgumentError, "Cannot judge hands" unless hand_1.respond_to?(:rank) && hand_2.respond_to?(:rank)
    case
    when RANKS[hand_1.rank] < RANKS[hand_2.rank] then hand_2
    when RANKS[hand_1.rank] > RANKS[hand_2.rank] then hand_1
    when RANKS[hand_1.rank] == RANKS[hand_2.rank] then judge_high_card(hand_1, hand_2)
    else raise ArgumentError, "Something went wrong judging cards"
    end
  end
end