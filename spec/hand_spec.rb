require 'hand'

describe Hand do

  describe "#initialize" do
    it "should initialize with a string and save that as an instance variable" do
      cards = 'AH KC 2D 10H 5S'
      hand = Hand.new(cards)

      expect(hand.cards).to eq(cards)
    end
  end

  describe "#identify" do
    it "should return 'invalid hand' when 'AH KC' is passed" do
      hand = Hand.new('AH KC')

      expect(hand.identify).to eq('invalid hand')
    end
  end

end
