require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe "Event" do
  before(:each) do
    @person = Person.new({
                          name: 'Hector',
                          interests: ['sewing', 'millinery', 'drawing']
                          })
    @craft = Craft.new('knitting', {yarn: 20,
                                    scissors: 1,
                                    knitting_needles: 2})
    @hector = Person.new({name: 'Hector',
                          interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni',
                        interests: ['sewing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
  end

  it "exists" do
    expect(@event).to be_a(Event)
  end

  it "has a name" do
    expect(@event.name).to eq("Carla's Craft Connection")
  end

  it "has crafts" do
    expect(@event.crafts).to eq([@sewing, @knitting])
  end

  it "has attendees" do
    expect(@event.attendees).to eq([@hector, @toni])
  end

  it "can list the attendee names" do
    expect(@event.attendee_names).to eq(["Hector", "Toni"])
  end
end
