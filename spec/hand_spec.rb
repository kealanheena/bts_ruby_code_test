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

      it "should return 'high card' when 'AH KC 2C 10H 5S' is passed regardless of capitalization" do
        hand = Hand.new('AH Kc 2C 10H 5s')

        expect(hand.identify).to eq('high card')
      end
    end

    describe "'one pair'" do
      it "should return 'one pair' when 'AH AC 2D 10H 5S' is passed" do
        hand = Hand.new('AH AC 2D 10H 5S')

        expect(hand.identify).to eq('one pair')
      end

      it "should return 'one pair' when '10C AC 2D 10H 5S' is passed" do
        hand = Hand.new('10C AC 2D 10H 5S')

        expect(hand.identify).to eq('one pair')
      end
    end

    describe "'two pair'" do
      it "should return 'two pair' when '5H 2C 2D 10H 5S' is passed" do
        hand = Hand.new('5H 2C 2D 10H 5S')

        expect(hand.identify).to eq('two pair')
      end

      it "should return 'two pair' when '10C AC AD 10H 5S' is passed" do
        hand = Hand.new('10C AC AD 10H 5S')

        expect(hand.identify).to eq('two pair')
      end
    end

    describe "'three of a kind'" do
      it "should return 'three of a kind' when 'AH AC AD 10H 5S' is passed" do
        hand = Hand.new('AH AC AD 10H 5S')

        expect(hand.identify).to eq('three of a kind')
      end

      it "should return 'three of a kind' when 'AH 5C 10D 10H 10S' is passed" do
        hand = Hand.new('AH 5C 10D 10H 10S')

        expect(hand.identify).to eq('three of a kind')
      end
    end

    describe "'straight'" do
      it "should return 'straight' when 'QH 8C JH 10S 9C' is passed" do
        hand = Hand.new('QH 8C JH 10S 9C')

        expect(hand.identify).to eq('straight')
      end

      it "should return 'straight' when '3H 7C 4H 6S 5C' is passed" do
        hand = Hand.new('3H 7C 4H 6S 5C')

        expect(hand.identify).to eq('straight')
      end
    end

    describe "'flush'" do
      it "should return 'flush' when '2H 5H AH 9H 10H' is passed" do
        hand = Hand.new('2H 5H AH 9H 10H')

        expect(hand.identify).to eq('flush')
      end

      it "should return 'flush' when '2S 5S AS 9S 10S' is passed" do
        hand = Hand.new('2S 5S AS 9S 10S')

        expect(hand.identify).to eq('flush')
      end
    end

    describe "'full house'" do
      it "should return 'full house' when 'AH AC 2D 2H 2S' is passed" do
        hand = Hand.new('AH AC 2D 2H 2S')

        expect(hand.identify).to eq('full house')
      end

      it "should return 'full house' when '5H 5C 10D 10H 10S' is passed" do
        hand = Hand.new('5H 5C 10D 10H 10S')

        expect(hand.identify).to eq('full house')
      end
    end

    describe "'four of a kind'" do
      it "should return 'four of a kind' when 'AH AC AD 10H AS' is passed" do
        hand = Hand.new('AH AC AD 10H AS')

        expect(hand.identify).to eq('four of a kind')
      end

      it "should return 'four of a kind' when 'AH 10C 10D 10H 10S' is passed" do
        hand = Hand.new('AH 10C 10D 10H 10S')

        expect(hand.identify).to eq('four of a kind')
      end
    end

    describe "'straight flush'" do
      it "should return 'straight flush' when '2H 3H 4H 5H 6H' is passed" do
        hand = Hand.new('2H 3H 4H 5H 6H')

        expect(hand.identify).to eq('straight flush')
      end

      it "should return 'straight flush' when '10S JS QS KS AS' is passed" do
        hand = Hand.new('10S JS QS KS AS')

        expect(hand.identify).to eq('straight flush')
      end
    end
  end

end
