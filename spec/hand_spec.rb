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
    it "should return 'invalid hand' when 'AH KC 2D 10H 5S' is passed" do
      hand = Hand.new('AH KC 2D 10H 5S')

      expect(hand.identify).to eq('high card')
    end

    describe "when the wrong amount of cards are passed" do
      it "should return 'invalid hand' when less than 5 cards are passed" do
        hand = Hand.new('AH KC')

        expect(hand.identify).to eq('invalid hand')
      end

      it "should return 'invalid hand' when more than 5 cards are passed" do
        hand = Hand.new('AH KC 2D 10H 5S QH')

        expect(hand.identify).to eq('invalid hand')
      end
    end
  end

end
