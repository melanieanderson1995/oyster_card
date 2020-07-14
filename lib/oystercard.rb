class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey
  UPPER_LIMIT = 90
  LOWER_LIMIT = 1
  MINIMUM_FARE = 2

  def initialize(balance = 10)
    @balance = balance
    @journeys = []
    @journey = {}
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{UPPER_LIMIT}" if (@balance += amount) > UPPER_LIMIT
    balance
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(entry_station)
    fail "Balance is below £#{LOWER_LIMIT}" if @balance < LOWER_LIMIT
    @entry_station = entry_station
    self
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
    self
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
