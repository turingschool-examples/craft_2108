require './lib/event'
require 'rspec'

describe Event do
  before(:each) do
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @zoey = Person.new({name: 'Zoey', interests: ['drawing', 'knitting']})
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting, @painting], [@toni, @hector, @zoey])
  end

  it 'has readable attributes' do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to be_a(Array)
    expect(@event.crafts).to include(@knitting)
    expect(@event.attendees).to be_a(Array)
    expect(@event.attendees).to include(@hector)
  end

  describe '#craft_with_most_supplies' do
    it 'returns the craft that requires the most types of supplies' do

      expect(@event.craft_with_most_supplies).to eq('sewing')
    end
  end

  describe '#supply_list' do
    it 'returns what supplies are required for all given crafts' do
      expect(@event.supply_list).to include("fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles")
    end
  end

  describe '#attendees_by_craft_interest' do
    it 'returns all attendees by craft interest' do
      expected = {
        "knitting"=>[@toni, @zoey],
        "painting"=>[],
        "sewing"=>[@toni, @hector]
      }
      expect(@event.attendees_by_craft_interest).to eq(expected)
    end
  end

  describe '#crafts_that_use' do
    it 'returns all crafts that use a given material' do
      expect(@event.crafts_that_use('scissors')).to eq([@sewing, @knitting])
      expect(@event.crafts_that_use('fire')).to eq([])
    end
  end

  describe '#assign_attendees_to_crafts' do
    it 'randomly assigns attendees to crafts' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      zoey = Person.new({name: 'Zoey', interests: ['drawing', 'knitting', 'painting']})
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
      event = Event.new("Carla's Craft Connection", [@sewing, @knitting, @painting], [toni, hector, zoey])

      expect(event.assign_attendees_to_crafts.values.flatten).to include(toni, hector, zoey)
      expect(event.assign_attendees_to_crafts[@sewing]).not_to include(zoey)
      expect(event.assign_attendees_to_crafts[@knitting]).not_to include(hector)
      expect(event.assign_attendees_to_crafts[@painting]).not_to include(toni)
    end
  end
end
