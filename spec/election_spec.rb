require "rspec"
require "./lib/candidate"
require "./lib/race"
require "./lib/election"


RSpec.describe Election do
  before(:each) do 
    @diana = Candidate.new({name: "Diana D", party: :democrat})
    @texas_race = Race.new("Texas Governor")
    @ohio_race = Race.new("Ohio Governor")
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

      expect(@election.add_race(@texas_race)).to eq([@texas_race])
      expect(@election.races).to eq([@texas_race])

      expect(@election.add_race(@ohio_race)).to eq([@texas_race, @ohio_race])
      expect(@election.races).to eq([@texas_race, @ohio_race])
    end
  end

  describe "#candidates" do
    it "shows a list of all candidates in that election year" do
      expect(@election.candidates).to eq([])

      candidate1 = @texas_race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @ohio_race.register_candidate!({name: "Roberto R", party: :republican})
      
      @election.add_race(@texas_race)
      expect(@election.candidates).to eq([candidate1])

      @election.add_race(@ohio_race)
      expect(@election.candidates).to eq([candidate1, candidate2])

      candidate3 = @ohio_race.register_candidate!({name: "Suzy S", party: :independent})
      expect(@election.candidates).to eq([candidate1, candidate2, candidate3])
    end
  end


end