class Hand
  # no magic numbers
  REQUIRED_AMOUNT_OF_CARDS = 5

  attr_reader :cards

  def initialize(cards)
    @cards = cards.upcase
    @cards_faces = get_cards_faces
    @cards_suits = get_cards_suits
  end

  def identify
    return identify_pair if duplicate_card_faces?

    return 'straight flush' if straight_flush?

    return 'flush' if flush?
      
    return 'straight' if straight?

    return 'high card'
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

  # this returns a hash with the card face (key) and 
  # the amount of that face in this hand (value)
  def get_faces_count
    @cards_faces.each_with_object(Hash.new(0)) { |key, hash| 
      hash[key] += 1 
    }
  end

  def get_numeric_cards_faces
    numeric_values = { 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }
    # this returns an array with only the cards faces and replaces 
    # any instance of J Q K or A with thier numeric value or converts
    # the string to an integer
    @cards_faces.map { |card| numeric_values[card] || card.to_i }
  end

  def update_pairs_array(faces_count, pairs)
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

  def identify_pair
    pairs = []
    faces_count = get_faces_count

    update_pairs_array(faces_count, pairs)
    
    return pairs[0] if pairs.length == 1
    
    return 'two pair' if pairs.uniq().length == 1

    return 'full house'
  end

  def duplicate_card_faces?
    @cards_faces.uniq().length != REQUIRED_AMOUNT_OF_CARDS
  end

  def flush?
    @cards_suits.uniq.length == 1
  end

  def straight?
    # sort the array and set the first number in array
    numeric_cards = get_numeric_cards_faces.sort
    prev_card = numeric_cards[0]
    first_card = numeric_cards[0] 
    last_card = numeric_cards[-1]

    # checks if loop around straight is possible and then checks for it
    # (to be possible the first card has to be 2 and the last card has to be A (14))
    return loop_around_straight?(numeric_cards, prev_card) if loop_around?(first_card, last_card)

    # go through each card in the array and check that the it is 
    # equal to the previous card plus 1 (if it isn't return false)
    cards_increment_by_one?(numeric_cards[1, REQUIRED_AMOUNT_OF_CARDS], prev_card)
  end

  def straight_flush?
    straight? && flush?
  end

  def loop_around?(first_card, last_card)
    first_card == 2 && last_card == 14
  end

  def loop_around_straight?(numeric_cards, prev_card)
    starting_index = 1

    # checks if the first X numers increment by 1
    numeric_cards[starting_index, REQUIRED_AMOUNT_OF_CARDS].each_with_index do |card, index|
      if prev_card + 1 != card 
        starting_index = index + 1
        prev_card = card
        break
      end

      prev_card = card
    end

    # checks if the remaining numbers in 
    cards_increment_by_one?(numeric_cards[starting_index + 1, REQUIRED_AMOUNT_OF_CARDS], prev_card)
  end

  def cards_increment_by_one?(numeric_cards, prev_card)
    numeric_cards.each do |card|
      return false if prev_card + 1 != card 

      prev_card = card
    end

    true
  end

end
