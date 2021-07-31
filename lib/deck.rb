require 'deck'

class Deck

  attr_reader :cards

  def initialize
    @suits = ['H', 'D', 'C', 'S']
    @faces = ['2', '3', '4', '5', 
              '6', '7', '8', '9', 
              '10', 'J', 'Q', 'K', 
              'A', '']
    # the empty item is so I can add a suit to A 
    # its cheesy but it works for now
    @cards = create_card_deck
  end

  private

  def create_card_deck
    @suits.map { |suit| @faces.join("#{suit} ").split }.flatten
  end

end
