class Hand

  AMOUNT_OF_CARDS = 5

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def identify
    return 'high card' if right_amount_of_cards? && @cards.split.uniq.length === AMOUNT_OF_CARDS
    
    'invalid hand'
  end

  private

  def right_amount_of_cards?
    @cards.split.length === AMOUNT_OF_CARDS 
  end

end
