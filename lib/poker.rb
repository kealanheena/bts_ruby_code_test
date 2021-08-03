require 'hand'

class Poker

  attr_reader :ranks

  def initialize
    @ranks = {
      "straight_flush" => 1, "four_of_a_kind" => 2, "full_house" => 3,
      "flush" => 4, "straight" => 5, "three_of_a_kind" => 6,
      "two_pair" => 7, "one_pair" => 8, "high_card" => 9
      }
  end

  def rank_hand(hand_rank)
    hand_rank_key = hand_rank.split().join('_')
    hand_rank_num = @ranks[hand_rank_key]
    
    return "#{hand_rank_num}. #{hand_rank}" if hand_rank_num

    "#{hand_rank}"
  end

end
