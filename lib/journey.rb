class Journey
  attr_reader :entry_station, :exit_station
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

  def fare
    entry_station == nil || exit_station == nil ? PENALTY_FARE : MINIMUM_FARE
  end

  def journey_complete?
    !!exit_station
  end
end
