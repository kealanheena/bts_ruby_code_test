require 'poker'
require 'hand'

describe Poker do

  before(:each) do
    # hand = double("h :identify => "straight", :initialize => '')
  end

  describe "#initialize" do
    it "should initialize with a hash of key value pairs for the card ranks" do
      ranks = {
      "straight_flush" => 1, "four_of_a_kind" => 2, "full_house" => 3,
      "flush" => 4, "straight" => 5, "three_of_a_kind" => 6,
      "two_pair" => 7, "one_pair" => 8, "high_card" => 9
      }

      hand = double("Hand", :cards => '')
      poker = Poker.new(hand)

      expect(poker.ranks).to eq(ranks)
    end
  end

  describe "valid hands" do
    describe "#rank_hand" do
      it "should return '1. straight flush' when straight flush is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 6H', :identify => 'straight flush')
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('1. straight flush')
      end

      it "should return '2. four of a kind' when four of a kind is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 6H', :identify => 'four of a kind')
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('2. four of a kind')
      end

      it "should return '3. full house' when full house is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 6H', :identify => 'full house')
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('3. full house')
      end

      it "should return '3. full house' when full house is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 6H', :identify => 'full house')
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('3. full house')
      end

      it "should return '4. flush' when flush is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 6H', :identify => 'flush')
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('4. flush')
      end

      it "should return '5. straight' when straight is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 6H', :identify => 'straight')
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('5. straight')
      end

      it "should return '6. three of a kind' when three of a kind is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 6H', :identify => 'three of a kind')
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('6. three of a kind')
      end

      it "should return '7. two pair' when two pair is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 6H', :identify => 'two pair')
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('7. two pair')
      end

      it "should return '8. one pair' when one pair is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 6H', :identify => 'one pair')
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('8. one pair')
      end

      it "should return '9. high card' when straight flush is passed" do
        hand = double("Hand", :cards => '2H 3C 4D 9H 6H', :identify => 'high card')
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('9. high card')
      end
    end

    describe "invalid hands" do
      it "should return 'invalid hand: not enough cards' when straight flush is passed" do
        hand = double("Hand", :cards => '4H 5H 6H 7H',)
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('invalid hand: not enough cards')
      end

      it "should return 'invalid hand: too many cards' when straight flush is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 6H 7H',)
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('invalid hand: too many cards')
      end

      it "should return 'invalid hand: duplicate cards' when straight flush is passed" do
        hand = double("Hand", :cards => '2H 3H 4H 5H 2H',)
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('invalid hand: duplicate cards')
      end

      it "should return 'invalid hand: invalid cards' when straight flush is passed" do
        hand = double("Hand", :cards => '2H 3Y 4H 5H 6V',)
        poker = Poker.new(hand)

        expect(poker.rank_hand).to eq('invalid hand: invalid cards')
      end
    end
  end

end
