class Race
  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(details)
      new_candidate = Candidate.new(details)
      @candidates << new_candidate
      new_candidate
  end

end