require_relative "journey"

class JourneyLog
  attr_accessor :journey_class, :current_journey

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @entry_station = entry_station
    @current_journey = current_journey
  end

  def finish(exit_station)
    current_journey.end_journey(exit_station)
    @journeys << @current_journey
    #@current_journey = nil
  end

  def journeys
    @journeys
  end

  def fare
    @current_journey.charge
    @current_journey = nil
  end

  def current_journey
    @current_journey ||= journey_class.new(@entry_station)
  end

end
