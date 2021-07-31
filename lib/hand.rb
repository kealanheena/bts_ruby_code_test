class Hand

  REQUIRED_AMOUNT_OF_CARDS = 5
  AMOUNT_OF_CARDS_IN_A_DECK = 52

  attr_reader :cards

  def initialize(cards)
    @suits = ['H', 'D', 'C', 'S']
    @faces = ['2', '3', '4', 
             '5', '6', '7', 
             '8', '9', '10', 
             'J', 'Q', 'K', 'A', ''] 
    # the empty item is so I can add a suit to A 
    # its cheesy but it works for now
    @deck = create_card_deck
    @cards = cards.upcase()
  end

  def identify
    return 'high card' if right_amount_of_cards? && no_duplicates? && valid_cards?
    
    'invalid hand'
  end

  private

  def valid_cards?
    (@deck - @cards.split()).length === AMOUNT_OF_CARDS_IN_A_DECK - REQUIRED_AMOUNT_OF_CARDS
  end

  def right_amount_of_cards?
    @cards.split().length === REQUIRED_AMOUNT_OF_CARDS 
  end

  def no_duplicates?
    @cards.split().uniq().length === REQUIRED_AMOUNT_OF_CARDS
  end

  def create_card_deck
    @suits.map { |suit| @faces.join("#{suit} ").split }.flatten
  end

end
