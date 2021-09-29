require 'rspec'
require './lib/event'

describe Event do
  before :each do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})

    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
  end

  it 'is an instance of Event' do
    expect(@event).to be_a Event
  end

  it '#name' do
    expect(@event.name).to eq "Carla's Craft Connection"
  end

  it '#crafts' do
    expect(@event.crafts).to eq [@sewing, @knitting]
  end

  it '#attendees' do
    expect(@event.attendees).to eq [@hector, @toni]
  end

  it '#craft_with_most_supplies' do
    expect(@event.craft_with_most_supplies).to eq "sewing"
  end

  it '#supply_list' do
    expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end
end