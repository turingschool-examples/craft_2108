require './lib/event'
require './lib/craft'
require './lib/person'
require 'rspec'

describe Event do
  before :each do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @person = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']
    })
    @event = Event.new("Carla's Craft Connection", @craft, @person)
  end

  it 'exists' do
    expect(@event).to be_an Event
  end

  it 'has readable attributes' do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq(@craft)
    expect(@event.attendees).to eq(@person)
  end

  describe '#attendee_names' do
    it 'can return attendee names' do
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @hector = Person.new({
        name: 'Hector',
        interests: ['sewing', 'millinery', 'drawing']
      })
      @toni = Person.new({
        name: 'Toni',
        interests: ['sewing', 'knitting']
      })
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])

      expect(@event.attendee_names).to eq(["Hector", "Toni"])
    end
  end
end