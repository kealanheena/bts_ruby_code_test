require 'hand'

describe Hand do

  describe "#initialize" do
    it "should initialize with a string and save that as an instance variable" do
      cards = 'AH KC 2D 10H 5S'
      hand = Hand.new(cards)

      expect(hand.cards).to eq(cards)
    end
  end

end
