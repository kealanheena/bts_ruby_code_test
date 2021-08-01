require 'deck'

class Hand
  # no magic numbers
  REQUIRED_AMOUNT_OF_CARDS = 5
  AMOUNT_OF_CARDS_IN_A_DECK = 52

  attr_reader :cards

  def initialize(cards, deck = Deck.new())
    @cards = cards.upcase
    @deck = deck
  end

  def identify
    if valid_hand?
      cards_faces = get_cards_faces
      return identify_pair(cards_faces) if duplicate_card_faces?(cards_faces)

      return 'straight flush' if straight_flush?

      return 'flush' if flush?
      
      return 'straight' if straight?

      return 'high card'
    end

    'invalid hand'
  end

  private

  def get_cards_suits
    @cards.split.map { |card| card[-1] }
  end

  def get_cards_faces
    # this actually worked as card[0] but this is better 
    # in case you want to change A J Q K to numeric values
    @cards.split.map { |card| card[0...-1] }
  end

  def get_numeric_cards_faces
    numeric_values = { 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }
    # this returns an array with only the cards faces and replaces 
    # any instance of J Q K or A with thier numeric value or converts
    # the string to an integer
    get_cards_faces.map { |card| numeric_values[card] || card.to_i }
  end

  def duplicate_card_faces?(cards_faces)
    cards_faces.uniq().length != REQUIRED_AMOUNT_OF_CARDS
  end

  def flush?
    get_cards_suits.uniq.length == 1
  end

  def straight?
    # sort the array and set the first number in array
    sorted_numeric_cards = get_numeric_cards_faces.sort
    previous_card = sorted_numeric_cards[0]
    # go through ech card in the array and check that the it is 
    # equal to the previous card plus 1 (if it isn't return false)
    sorted_numeric_cards[1, REQUIRED_AMOUNT_OF_CARDS].each do |card|
      return false if previous_card + 1 != card

      previous_card = card
    end

    true
  end

  def straight_flush?
    straight? && flush?
  end

  def update_array_of_pairs(faces_count, pairs)
    faces_count.each do |_key, value|
      case value
        when 4
          pairs << 'four of a kind'
        when 3
          pairs << 'three of a kind'
        when 2
          pairs << 'one pair'
      end
    end
  end

  def identify_pair(cards_faces)
    pairs = []
    faces_count = get_faces_count(cards_faces)

    update_array_of_pairs(faces_count, pairs)
    
    return pairs[0] if pairs.length == 1
    
    return 'two pair' if pairs.uniq().length == 1

    return 'full house'
  end

  # this returns a hash with the card face (key) and 
  # the amount of that face in this hand (value)
  def get_faces_count(cards_faces)
    cards_faces.each_with_object(Hash.new(0)) { |key, hash| 
      hash[key] += 1 
    }
  end

  # this honestly had me torn because I think it was previously more readable
  # but this is DRYer so I decided to go with that and just explain it with comments
  def valid_hand?
    # what we're doing is:
    # 1. removing our hand from the deck
    #    • it will only remove the valid cards
    #    • it will only remove a card once
    # 2. checking if the amount of remaining cards the same as 
    #    AMOUNT_OF_CARDS_IN_A_DECK minus REQUIRED_AMOUNT_OF_CARDS
    (@deck - @cards.split()).length == AMOUNT_OF_CARDS_IN_A_DECK - REQUIRED_AMOUNT_OF_CARDS
  end

end
