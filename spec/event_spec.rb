require './lib/event'
require './lib/craft'
require './lib/person'
require 'rspec'

describe Event do
  it 'exists' do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @person = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']
    })
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])

    expect(@event).to be_an Event
  end

  it 'has readable attributes' do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @person = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']
    })
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])

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

  describe '#attendees_by_craft_interest' do
    it 'can return all attendees by craft interest' do
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})

      @hector = Person.new({
        name: 'Hector',
        interests: ['sewing', 'millinery', 'drawing']
      })
      @toni = Person.new({
        name: 'Toni',
        interests: ['sewing', 'knitting']
      })
      @zoey = Person.new({
        name: 'Zoey',
        interests: ['drawing', 'knitting']
      })
      @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @zoey])

      expected = {
         "knitting"=>[@toni, @zoey],
         "painting"=>[],
         "sewing"=>[@hector, @toni]
      }
      expect(@event.attendees_by_craft_interest).to eq(expected)
    end
  end
end
