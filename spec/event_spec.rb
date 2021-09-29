require 'rspec'
require './lib/event'

describe Event do
  before :each do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end

  it 'is an instance of Event' do
    expect(@event).to be_a Event
  end

  it '#name' do
    expect(@event.name).to eq "Carla's Craft Connection"
  end

  it '#crafts' do
    expect(@event.crafts).to eq [@craft]
  end

  it '#attendees' do
    expect(@event.attendees).to eq [@person]
  end
end