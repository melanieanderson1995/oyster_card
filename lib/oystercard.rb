require_relative "journey"
require_relative "journey_log"
require_relative "./station"

class Oystercard
  attr_reader :balance, :journey, :current_journey
  UPPER_LIMIT = 90
  LOWER_LIMIT = 1
  MINIMUM_FARE = 1

  def initialize(balance = 10, current_journey = JourneyLog.new)
    @balance = balance
    @current_journey = current_journey
    @journeys = @current_journey.journeys
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{UPPER_LIMIT}" if (@balance += amount) > UPPER_LIMIT
    balance
  end

  def in_journey?
    !!@current_journey
  end

  def touch_in(entry_station = Station.new)
    fail "Balance is below £#{LOWER_LIMIT}" if @balance < LOWER_LIMIT
    @current_journey.start(entry_station)
    self
  end

  def touch_out(exit_station = Station.new)
    @current_journey.finish(exit_station)
    deduct(@current_journey.current_journey.charge)
    @current_journey.current_journey.reset
    self
  end

  def journeys
    @journeys.dup
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
