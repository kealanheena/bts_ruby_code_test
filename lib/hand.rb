class Hand

  AMOUNT_OF_CARDS = 5

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def identify
    return 'invalid hand' unless right_amount_of_cards?
    
    'high card'
  end

  private

  def right_amount_of_cards?
    @cards.split.length === AMOUNT_OF_CARDS 
  end

end
