require "rspec"
require "./lib/candidate"
require "./lib/race"

RSpec.describe Race do
  
  before(:each) do 
    @diana = Candidate.new({name: "Diana D", party: :democrat})
    @race = Race.new("Texas Governor")
  end

  describe "#initialize" do 
    it "exists" do 
      expect(@race).to be_a(Race)
    end

    it "has readable attributes" do 
      expect(@race.office).to eq("Texas Governor")
      expect(@race.candidates).to eq([])
    end
  end

  describe "#register_candidate!" do
    it "registers a candidate" do
      expect(@race.candidates).to eq([])

      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      
      expect(candidate1.class).to be(Candidate)
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
      expect(@race.candidates).to eq([candidate1])

      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
      expect(candidate2.class).to be(Candidate)
      expect(@race.candidates).to eq([candidate1, candidate2])
    end
  end

end