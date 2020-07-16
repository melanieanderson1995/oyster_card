require_relative "journey"

class Oystercard
  attr_reader :balance, :journeys, :journey, :current_journey
  UPPER_LIMIT = 90
  LOWER_LIMIT = 1
  MINIMUM_FARE = 1

  def initialize(balance = 10)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{UPPER_LIMIT}" if (@balance += amount) > UPPER_LIMIT
    balance
  end

  def in_journey?
    !!@current_journey
  end

  def touch_in(entry_station)
    fail "Balance is below £#{LOWER_LIMIT}" if @balance < LOWER_LIMIT
    @current_journey = Journey.new(entry_station)
    self
  end

  def touch_out(exit_station)
    @current_journey.end_journey(exit_station)
    deduct(@current_journey.fare)
    save_journeys
    self
  end

  def save_journeys
    @journeys << @current_journey
    @current_journey = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
