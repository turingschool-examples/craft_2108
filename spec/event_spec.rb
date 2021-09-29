require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  before :each do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@knitting], [@hector])
  end

  context '#initialize' do
    it 'exists' do
      expect(@event).to be_an Event
    end

    it 'has readable attributes' do
      expect(@event.name).to eq "Carla's Craft Connection"
      expect(@event.crafts).to eq [@knitting]
      expect(@event.attendees).to eq [@hector]
    end
  end

  context 'Iteration 2' do
    before :each do
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    end

    it '#attendee names' do
      expect(@event.attendee_names).to eq ['Hector', 'Toni']
    end

    it '#craft_with_most_supplies' do
      expect(@event.craft_with_most_supplies).to eq 'sewing'
    end

    it '#supply_list' do
      expect(@event.supply_list).to eq ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
    end
  end

  context 'Iteration 3' do
    before :each do
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @zoey = Person.new({name: 'Zoey', interests: ['drawing', 'knitting']})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      @event = Event.new("Carla's Craft Connection", [@knitting, @sewing, @painting], [@hector, @toni, @zoey])
    end

    it '#attendees_by_craft_interest' do
      expect(@event.attendees_by_craft_interest).to eq({
        'knitting' => [@toni, @zoey],
        'painting' => [],
        'sewing' => [@hector, @toni]
      })
    end

    it '#crafts_that_use' do
      expect(@event.crafts_that_use('scissors')).to eq [@knitting, @sewing]
      expect(@event.crafts_that_use('fire')).to eq []
    end
  end

  context 'Iteration 4' do
    xit '#assign_attendees_to_crafts assigns randomly' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      zoey = Person.new({name: 'Zoey', interests: ['drawing', 'knitting', 'painting']})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})

      toni.add_supply('yarn', 30)
      toni.add_supply('scissors', 2)
      toni.add_supply('knitting_needles', 5)
      toni.add_supply('fabric', 10)
      toni.add_supply('scissors', 1)
      toni.add_supply('thread', 2)
      toni.add_supply('paint_brush', 10)
      toni.add_supply('paints', 20)
      zoey.add_supply('yarn', 20)
      zoey.add_supply('scissors', 2)
      zoey.add_supply('knitting_needles', 2)
      hector.add_supply('fabric', 5)
      hector.add_supply('scissors', 1)
      hector.add_supply('thread', 1)
      hector.add_supply('canvas', 5)
      hector.add_supply('paint_brush', 10)
      hector.add_supply('paints', 20)

      event = Event.new("Carla's Craft Connection", [knitting, sewing, painting], [hector, toni, zoey])

      assignment1 = event.assign_attendees_to_crafts
      assignment2 = event.assign_attendees_to_crafts
      assignment3 = event.assign_attendees_to_crafts

      expect(assignment1 != assignment2).to be true
      expect(assignment2 != assignment3).to be true
      expect(assignment1 != assignment3).to be true
    end
  end
end
