require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it 'exists' do
    expect(@event).to be_an_instance_of(Event)
  end

  it 'has readable attributes' do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq([@craft])
    expect(@event.attendees).to eq([@person])
  end

  it 'can find attendee_names' do
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    expect(@event.attendee_names).to eq(["Hector", "Toni"])
  end

  it 'can find craft with the most supplies' do
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    expect(@event.craft_with_most_supplies).to eq("sewing")
  end

  it 'can return a supply list' do
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end 
end
