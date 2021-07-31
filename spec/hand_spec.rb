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
    describe "'high card'" do
      it "should return 'high card' when 'AH KC 2D 10H 5S' is passed" do
        hand = Hand.new('AH KC 2D 10H 5S')

        expect(hand.identify).to eq('high card')
      end

      it "should return 'high card' when 'AH KC 2D 10H 5S' is passed regardless of capitalization" do
        hand = Hand.new('AH Kc 2d 10H 5s')

        expect(hand.identify).to eq('high card')
      end
    end

    describe "'one pair'" do
      it "should return 'one pair' when ''AH AC 2D 10H 5S' is passed" do
        hand = Hand.new('AH AC 2D 10H 5S')

        expect(hand.identify).to eq('one pair')
      end

      it "should return 'one pair' when '10C AC 2D 10H 5S' is passed" do
        hand = Hand.new('10C AC 2D 10H 5S')

        expect(hand.identify).to eq('one pair')
      end
    end

    describe "'high card'" do
      it "should return 'high card' when 'AH KC 2D 10H 5S' is passed" do
        hand = Hand.new('AH KC 2D 10H 5S')

        expect(hand.identify).to eq('high card')
      end

      it "should return 'high card' when 'AH KC 2D 10H 5S' is passed regardless of capitalization" do
        hand = Hand.new('AH Kc 2d 10H 5s')

        expect(hand.identify).to eq('high card')
      end
    end

    describe "'invalid hand'" do
      it "should return 'invalid hand' when duplicate cards are passed" do
        hand = Hand.new('AH 12H QH KS JL')

        expect(hand.identify).to eq('invalid hand')
      end

      it "should return 'invalid hand' when duplicate cards are passed" do
        hand = Hand.new('AH AH QH KS JC')

        expect(hand.identify).to eq('invalid hand')
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

end
