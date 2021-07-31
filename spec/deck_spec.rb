require 'deck'

describe Deck do

  describe "#initialize" do
    it "should initialize with a hash of key value pairs for the card ranks" do
      deck = Deck.new()

      expect(deck.cards.length).to eq(52)
    end
  end

end
