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
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end

  it 'exists' do
    expect(@event).to be_an Event
  end

  it 'has readable attributes' do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq([@craft])
    expect(@event.attendees).to eq([@person])
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

  describe '#craft_with_most_supplies' do
    it 'can return the craft with the most supplies' do
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

      expect(@event.craft_with_most_supplies).to eq('sewing')
    end
  end

  describe '#supply_list' do
    it 'can return the supply list in hash' do
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

      expected = ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
      expect(@event.supply_list).to eq(expected)
    end
  end

  describe '#can_build?' do
    it 'can tell if attendee has enough supplies required' do
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @hector = Person.new({
        name: 'Hector',
        interests: ['sewing', 'millinery', 'drawing']
      })
      @event = Event.new("Carla's Craft Connection", [@sewing], [@hector])

      expect(@hector.can_build?(@sewing)).to be false

      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)

      expect(@hector.can_build?(@sewing)).to be false

      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)

      expect(@hector.can_build?(@sewing)).to be true
    end
  end 
end
