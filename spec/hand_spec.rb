require 'hand'

describe Hand do

  before(:each) do
    @deck = ["2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "JH", "QH", "KH", "AH", 
             "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD", "AD", 
             "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC", "AC", 
             "2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "JS", "QS", "KS", "AS"] 
  end

  describe "#initialize" do
    it "should initialize with a string and save that as an instance variable" do
      cards = 'AH KC 2D 10H 5S'
      hand = Hand.new(cards, @deck)

      expect(hand.cards).to eq(cards)
    end
  end

  describe "#identify" do
    describe "'high card'" do
      it "should return 'high card' when 'AH KC 2D 10H 5S' is passed" do
        hand = Hand.new('AH KC 2D 10H 5S', @deck)

        expect(hand.identify).to eq('high card')
      end

      it "should return 'high card' when 'AH KC 2C 10H 5S' is passed regardless of capitalization" do
        hand = Hand.new('AH Kc 2C 10H 5s', @deck)

        expect(hand.identify).to eq('high card')
      end
    end

    describe "'one pair'" do
      it "should return 'one pair' when 'AH AC 2D 10H 5S' is passed" do
        hand = Hand.new('AH AC 2D 10H 5S', @deck)

        expect(hand.identify).to eq('one pair')
      end

      it "should return 'one pair' when '10C AC 2D 10H 5S' is passed" do
        hand = Hand.new('10C AC 2D 10H 5S', @deck)

        expect(hand.identify).to eq('one pair')
      end
    end

    describe "'two pair'" do
      it "should return 'two pair' when '5H 2C 2D 10H 5S' is passed" do
        hand = Hand.new('5H 2C 2D 10H 5S', @deck)

        expect(hand.identify).to eq('two pair')
      end

      it "should return 'two pair' when '10C AC AD 10H 5S' is passed" do
        hand = Hand.new('10C AC AD 10H 5S', @deck)

        expect(hand.identify).to eq('two pair')
      end
    end

    describe "'three of a kind'" do
      it "should return 'three of a kind' when 'AH AC AD 10H 5S' is passed" do
        hand = Hand.new('AH AC AD 10H 5S', @deck)

        expect(hand.identify).to eq('three of a kind')
      end

      it "should return 'three of a kind' when 'AH 5C 10D 10H 10S' is passed" do
        hand = Hand.new('AH 5C 10D 10H 10S', @deck)

        expect(hand.identify).to eq('three of a kind')
      end
    end

    describe "'straight'" do
      it "should return 'straight' when 'QH 8C JH 10S 9C' is passed" do
        hand = Hand.new('QH 8C JH 10S 9C', @deck)

        expect(hand.identify).to eq('straight')
      end

      it "should return 'straight' when '3H 7C 4H 6S 5C' is passed" do
        hand = Hand.new('3H 7C 4H 6S 5C', @deck)

        expect(hand.identify).to eq('straight')
      end
    end

    describe "'flush'" do
      it "should return 'flush' when '2H 5H AH 9H 10H' is passed" do
        hand = Hand.new('2H 5H AH 9H 10H', @deck)

        expect(hand.identify).to eq('flush')
      end

      it "should return 'flush' when '2S 5S AS 9S 10S' is passed" do
        hand = Hand.new('2S 5S AS 9S 10S', @deck)

        expect(hand.identify).to eq('flush')
      end
    end

    describe "'full house'" do
      it "should return 'full house' when 'AH AC 2D 2H 2S' is passed" do
        hand = Hand.new('AH AC 2D 2H 2S', @deck)

        expect(hand.identify).to eq('full house')
      end

      it "should return 'full house' when '5H 5C 10D 10H 10S' is passed" do
        hand = Hand.new('5H 5C 10D 10H 10S', @deck)

        expect(hand.identify).to eq('full house')
      end
    end

    describe "'four of a kind'" do
      it "should return 'four of a kind' when 'AH AC AD 10H AS' is passed" do
        hand = Hand.new('AH AC AD 10H AS', @deck)

        expect(hand.identify).to eq('four of a kind')
      end

      it "should return 'four of a kind' when 'AH 10C 10D 10H 10S' is passed" do
        hand = Hand.new('AH 10C 10D 10H 10S', @deck)

        expect(hand.identify).to eq('four of a kind')
      end
    end

    describe "'straight flush'" do
      it "should return 'straight flush' when '2H 3H 4H 5H 6H' is passed" do
        hand = Hand.new('2H 3H 4H 5H 6H', @deck)

        expect(hand.identify).to eq('straight flush')
      end

      it "should return 'straight flush' when '10S JS QS KS AS' is passed" do
        hand = Hand.new('10S JS QS KS AS', @deck)

        expect(hand.identify).to eq('straight flush')
      end
    end

    describe "'invalid hand'" do
      describe "when duplicate cards are passed" do
        it "should return 'invalid hand: duplicate cards' when duplicate cards are passed" do
          hand = Hand.new('AH QH QH KS JS', @deck)

          expect(hand.identify).to eq('invalid hand: duplicate cards')
        end

        it "should return 'invalid hand: duplicate cards' when duplicate cards are passed" do
          hand = Hand.new('AH AH QH KS JC', @deck)

          expect(hand.identify).to eq('invalid hand: duplicate cards')
        end
      end

      describe "when the wrong amount of cards are passed" do
        it "should return 'invalid hand: not enough cards' when less than 5 cards are passed" do
          hand = Hand.new('AH KC', @deck)

          expect(hand.identify).to eq('invalid hand: not enough cards')
        end

        it "should return 'invalid hand: too many cards' when more than 5 cards are passed" do
          hand = Hand.new('AH KC 2D 10H 5S QH', @deck)

          expect(hand.identify).to eq('invalid hand: too many cards')
        end
      end

      describe "when invalid cards are passed" do
        it "should return 'invalid hand: invalid cards' when duplicate cards are passed" do
          hand = Hand.new('AL 12G QH KS JL', @deck)

          expect(hand.identify).to eq('invalid hand: invalid cards')
        end

        it "should return 'invalid hand: invalid cards' when duplicate cards are passed" do
          hand = Hand.new('AA AQ QH KV JC', @deck)

          expect(hand.identify).to eq('invalid hand: invalid cards')
        end
      end
    end
  end

end
