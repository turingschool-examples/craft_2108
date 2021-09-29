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
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting, @painting], [@carla, @hector, @zoey])
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
      expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end
  end

  describe '#attendees_by_craft_interest' do
    it 'returns all attendees by craft interest' do
    end
  end
end
