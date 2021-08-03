require 'poker'
# require 'hand'

describe Poker do

  # before do
  #   expect_any_instance_of(Hand).to receive('').and_return('')
  # end

  describe "#initialize" do
    it "should initialize with a hash of key value pairs for the card ranks" do
      ranks = {
      "straight_flush" => 1, "four_of_a_kind" => 2, "full_house" => 3,
      "flush" => 4, "straight" => 5, "three_of_a_kind" => 6,
      "two_pair" => 7, "one_pair" => 8, "high_card" => 9
      }

      poker = Poker.new()

      expect(poker.ranks).to eq(ranks)
    end
  end

  describe "#rank_hand" do
    it "should return '1. straight flush' when straight flush is passed" do
      poker = Poker.new()

      expect(poker.rank_hand('straight flush')).to eq('1. straight flush')
    end

    it "should return a hash with players and their hands" do
      poker = Poker.new()

      expect(poker.rank_hand('high card')).to eq('9. high card')
    end

    it "should return a hash with players and their hands" do
      poker = Poker.new()

      expect(poker.rank_hand('invalid hand')).to eq('invalid hand')
    end
  end

end
