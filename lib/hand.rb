class Hand

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def identify
    return 'invalid hand'
  end

end
