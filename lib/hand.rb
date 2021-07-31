class Hand

  # no magic numbers
  REQUIRED_AMOUNT_OF_CARDS = 5
  AMOUNT_OF_CARDS_IN_A_DECK = 52

  attr_reader :cards

  def initialize(cards)
    @suits = ['H', 'D', 'C', 'S']
    @faces = [
      '2', '3', '4', '5', 
      '6', '7', '8', '9', 
      '10', 'J', 'Q', 'K', 
      'A', ''
    ]
    # the empty item is so I can add a suit to A 
    # its cheesy but it works for now
    @deck = create_card_deck
    @cards = cards.upcase
  end

  def identify
    if valid_hand?
      cards_faces = get_cards_faces
      if duplicate_card_faces?(cards_faces)
        pairs = []
        faces_count = get_faces_count(cards_faces)

        check_pairs(faces_count, pairs)

        return pairs[0]
      end

      return 'high card'
    end

    'invalid hand'
  end

  private

  def get_cards_faces
    @cards.split.map { |card| card[0] }
  end

  def duplicate_card_faces?(cards_faces)
    cards_faces.uniq().length != REQUIRED_AMOUNT_OF_CARDS
  end

  # this returns a hash with the card face (key) and 
  # the amount of that face in this hand (value)
  def get_faces_count(cards_faces)
    cards_faces.each_with_object(Hash.new(0)) { |key, hash| 
      hash[key] += 1 
    }
  end

  def check_pairs(faces_count, pairs)
    faces_count.each do |_key, value|
      case value
        when 4
          pairs << 'four of a kind'
          break
        when 3
          pairs << 'three of a kind'
        when 2
          pairs << 'one pair'
      end
    end
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

  def create_card_deck
    @suits.map { |suit| @faces.join("#{suit} ").split }.flatten
  end

end
