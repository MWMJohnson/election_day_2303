require "rspec"
require "./lib/candidate"
require "./lib/race"
require "./lib/election"


RSpec.describe Election do
  before(:each) do 
    @diana = Candidate.new({name: "Diana D", party: :democrat})
    @texas_race = Race.new("Texas Governor")
    @election = Election.new("2024")
  end

  describe "#initialize(year)" do 
    it "exists" do 
      expect(@election).to be_a(Election)
    end

    it "has readable attributes" do 
      expect(@election.year).to eq("2024")
      expect(@election.races).to eq([])
    end
  end

  describe "#add_race(race)" do
    it "adds a race to the races list" do
      expect(@election.races).to eq([])

      @election.add_race(@texas_race)

      expect(@election.races).to eq([@texas_race])
    end
  end


end