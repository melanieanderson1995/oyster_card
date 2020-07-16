require "journey"

describe Journey do
  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station) }

  it "starts journey" do
    journey = Journey.new(entry_station)
    expect(journey.entry_station).to eq entry_station
  end

  it "checks if journey complete" do
    journey = Journey.new(entry_station)
    journey.end_journey(exit_station)
    expect(journey.journey_complete?).to be true
  end

  it "checks if journey is incomplete" do
    journey = Journey.new(entry_station)
    expect(journey.journey_complete?).to_not be true
  end

  describe "#fare" do

    it "returns minimum fare" do
      journey = Journey.new(entry_station)
      journey.end_journey(exit_station)
      journey.journey_complete?
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it "returns penalty fare if entry_station is nil" do
      journey = Journey.new(entry_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "returns penatly fare if exit_station is nil" do
      journey = Journey.new
      journey.end_journey(exit_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

end


# call Journey.new
# FAIL
# Write unit test to test for entry_station (aka journey start)
# Create Journey class(entry_station)
# Update to use @current_journey
# Update entry_station and exit_station into Journey class

# call Journey.new.journey_complete?
# FAIL
# Write unit test to test for journey_complete? using journey.end_journey.journey_complete? = true, journey.journey_complete? = false
# Write journey_complete? using !!exit_station

# call Journey.new.fare
# FAIL
# Write unit test to get fare of journey
# set entry_station and exit_station default value to nil
# Create constant MINIMUM_FARE, create constant PENALTY_FARE
# Write pipe (single line if statement)
