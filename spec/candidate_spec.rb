require "rspec"
require "./lib/candidate"

RSpec.describe Candidate do

  before(:each) do 
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  describe "#initialize(details)" do 
    it "exists" do 
      expect(@diana).to be_a(Candidate)
    end

    it "has readable attributes" do 
      expect(@diana.name).to eq("Diana D")
      expect(@diana.party).to eq(:democrat)
      expect(@diana.votes).to eq(0)
    end
  end

  describe "#vote_for!" do 
    it "adds a vote for the candidate" do 
      expect(@diana.votes).to eq(0)

      @diana.vote_for!
      @diana.vote_for!
      @diana.vote_for!

      expect(@diana.votes).to eq(3)

      @diana.vote_for!
      expect(@diana.votes).to eq(4)
    end
  end
  
end