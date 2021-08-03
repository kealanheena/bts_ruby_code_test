require 'hand'

class Poker

  REQUIRED_AMOUNT_OF_CARDS = 5
  AMOUNT_OF_CARDS_IN_A_DECK = 52

  attr_reader :ranks

  def initialize(hand)
    @hand = hand
    @deck = create_card_deck
    @hand_cards = @hand.cards
    @ranks = {
      "straight_flush" => 1, "four_of_a_kind" => 2, "full_house" => 3,
      "flush" => 4, "straight" => 5, "three_of_a_kind" => 6,
      "two_pair" => 7, "one_pair" => 8, "high_card" => 9
      }
  end

  def rank_hand
    return "invalid hand: #{get_invalid_hand_type}" if invalid_hand?

    hand_rank = @hand.identify
    hand_rank_key = hand_rank.split().join('_')
    hand_rank_num = @ranks[hand_rank_key]
    
    return "#{hand_rank_num}. #{hand_rank}" if hand_rank_num

  end

  private

  def get_invalid_hand_type
    return 'not enough cards' if not_enough_cards?

    return 'too many cards' if too_many_cards?

    return 'duplicate cards' if duplicate_cards?

    'invalid cards'
  end

  def not_enough_cards?
    @hand_cards.split().length < REQUIRED_AMOUNT_OF_CARDS
  end

  def too_many_cards?
    @hand_cards.split().length > REQUIRED_AMOUNT_OF_CARDS
  end

  def duplicate_cards?
    @hand_cards.split().uniq().length < REQUIRED_AMOUNT_OF_CARDS
  end

  # this honestly had me torn because I think it was previously more readable
  # but this is DRYer so I decided to go with that and just explain it with comments
  def invalid_hand?
    # what we're doing is:
    # 1. removing our hand from the deck
    #    • it will only remove the valid cards
    #    • it will only remove a card once
    # 2. checking if the amount of remaining cards the same as 
    #    AMOUNT_OF_CARDS_IN_A_DECK minus REQUIRED_AMOUNT_OF_CARDS
    (@deck - @hand_cards.split()).length != AMOUNT_OF_CARDS_IN_A_DECK - REQUIRED_AMOUNT_OF_CARDS
  end

  def create_card_deck
    suits = ['H', 'D', 'C', 'S']
    faces = ['2', '3', '4', '5', 
             '6', '7', '8', '9', 
             '10', 'J', 'Q', 'K', 
             'A', '']

    suits.map { |suit| faces.join("#{suit} ").split }.flatten
  end

end
