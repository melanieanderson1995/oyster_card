require_relative "station"
class Journey
  attr_accessor :entry_station, :exit_station, :current_journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
    self
  end


  def charge
    @entry_station && @exit_station ?
      MINIMUM_FARE + (@entry_station.zone - @exit_station.zone).abs :
      PENALTY_FARE
  end

  def reset
    @entry_station = nil
    @exit_station = nil
  end
  #def fare
  #  @entry_station.nil || @exit_station.nil ? PENALTY_FARE : MINIMUM_FARE
  #end

  def journey_complete?
    !!exit_station
  end

  def new(entry_station)
    Journey.new(entry_station)
  end
end
