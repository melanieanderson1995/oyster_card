class Oystercard
  attr_reader :balance, :entry_station
  UPPER_LIMIT = 90
  LOWER_LIMIT = 1
  MINIMUM_FARE = 2

  def initialize(balance = 10)
    @balance = balance
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{UPPER_LIMIT}" if (@balance += amount) > UPPER_LIMIT
    balance
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Balance is below £#{LOWER_LIMIT}" if @balance < LOWER_LIMIT
    @entry_station = station
    self
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
    self
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
