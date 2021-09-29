require './lib/event'
require './lib/craft'
require './lib/person'

RSpec.describe Event do
  xit 'exists' do
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event).to be_an_instance_of(Event)
  end

  it '#attributes' do
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.name).to eq("Carla's Craft Connection")
  end
end