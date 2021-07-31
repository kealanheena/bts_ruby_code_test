require 'poker'

describe Poker do

  describe "#initialize" do
    it "should initialize with a hash of key value pairs for the card ranks" do
      ranks = {
        :straight_flush => 1, :four_of_a_kind => 2, :full_house => 3,
        :flush => 4, :straight => 5, :three_of_a_kind => 6,
        :two_pair => 7, :one_pair => 8, :high_card => 9
      }

      poker = Poker.new()

      expect(poker.ranks).to eq(ranks)
    end
  end

end
