require 'poker'

describe Poker do

  describe "#initialize" do
    it "should initialize with a hash of key value pairs" do
      ranks = {
        :full_house => 1,
        :three_of_a_kind => 2
      }
      poker = Poker.new(ranks)

      expect(poker.ranks).to eq(ranks)
    end
  end

end
