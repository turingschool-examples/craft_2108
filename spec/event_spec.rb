require './lib/person'
require './lib/craft'
require './lib/event'

describe Event do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event =event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end

  it 'exists' do
    expect(@event).to be_an_instance_of(Event)
  end
end
