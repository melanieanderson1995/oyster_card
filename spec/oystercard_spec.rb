# Uninitialized constant Oystercard (NameError)
# ./spec/oystercard_spec.rb:2:in `<top (required)>'
# line 2
# Create class file oystercard.rb and create class Oystercard, link to spec file
# try to make instance of Oystercard in irb, oystercard.balance
# create initialize method with default balance
# create attr_reader :balance
require "oystercard"

describe Oystercard do
  let(:station) { double :station }

  it "creates an oystercard" do
    expect(Oystercard.new).to be_a(Oystercard)
  end

  it "has a starting balance of default balance" do
    expect(subject.balance).to eq subject.balance
  end

  describe "#top_up()" do
    it "can top_up" do
      expect(subject.top_up(5)).to eq subject.balance
    end

    it "cannot top up past upper_limit" do
      expect{ subject.top_up(90) }.to raise_error "Balance cannot exceed £#{Oystercard::UPPER_LIMIT}"
    end
  end

  describe "#deduct()" do

    it "deducts minimum fare from balance when touch_out" do
      expect{ subject.touch_in(station).touch_out}.to change{subject.balance}.by (-Oystercard::MINIMUM_FARE)
    end
  end

  describe "#in_journey?" do
    it "can touch in" do
      expect(subject.touch_in(station).in_journey?).to be true
    end

    it "can touch out" do
      expect(subject.touch_in(station).touch_out.in_journey?).not_to be true
    end

    it "stores entry_station after touch_in" do
      expect(subject.touch_in(station).entry_station).to eq station
    end
  end

  it "checks that there is minimum balance for single journey" do
    expect{ Oystercard.new(0).touch_in(station) }.to raise_error "Balance is below £#{Oystercard::LOWER_LIMIT}"
  end

end

# initialize an instance of the Oystercard class, balance = 0/default
# call top_up(with an argument) on instance of Oystercard (oystercard)
# FAIL
# call balance on oystercard and check balance has increased to argument

# initialize an instance of the Oystercard class, balance = 0
# call top_up(>90) on oystercard
# FAIL
# Write unit test using raise error
# create constant upper_limit = 90 for balance
# implement limit in the top_up method, include upper_limit value

# initialize with 10
# call deduct(5) on instance
# FAIL
# Write unit test
# call deduct(with an argument) on oystercard
# call balance on oystercard and check balance has decreased to argument

# call oystercard.touch_in
# FAIL
# Write unit test
# Write in_journey? method with in_journey as instance variable
# Write touch_in method to change in_journey == true
# Write touch_out method to change in_journey == false
# touch_in should respond in_journey == true if has been touched in
# touch_out should respond in_journey == false if has been touched out

# call oystercard.touch_in(entry_station)
# FAIL
# Write unit test
# Create instance variable @entry_station
# Update touch_in to accept argument of (entry_station)
