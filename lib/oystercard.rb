class Oystercard
  attr_reader :balance, :in_use
  UPPER_LIMIT = 90
  LOWER_LIMIT = 1

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{UPPER_LIMIT}" if (@balance += amount) > UPPER_LIMIT
    balance
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_use
  end

  def touch_in
    fail "Balance is below £#{LOWER_LIMIT}" if @balance < LOWER_LIMIT
    @in_use = true
    self
  end

  def touch_out
    @in_use = false
    self
  end

end
