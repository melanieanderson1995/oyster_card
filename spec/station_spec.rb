require "station"

describe Station do
  subject = Station.new("name", "zone")
  it "has a name" do
    expect(subject.name).to eq "name"
  end

  it "has a zone" do
    expect(subject.zone).to eq "zone"
  end

end


# try to create new station(name, zone)
# FAIL
# Write unit test to check that it has name and zone variable
# Create zone class with name and zone variable
