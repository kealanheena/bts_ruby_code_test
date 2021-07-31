class Hand

  AMOUNT_OF_CARDS = 5

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def identify
    return 'invalid hand' unless cards.split.length === AMOUNT_OF_CARDS 
    
    'high card'
  end

end
