require 'rspec'
require './lib/event'

describe Event do
  before :each do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @zoey = Person.new({name: 'Zoey', interests: ['drawing', 'knitting']})

    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    
    @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @zoey])
  end

  it 'is an instance of Event' do
    expect(@event).to be_a Event
  end

  it '#name' do
    expect(@event.name).to eq "Carla's Craft Connection"
  end

  it '#crafts' do
    expect(@event.crafts).to eq [@knitting, @painting, @sewing]
  end

  it '#attendees' do
    expect(@event.attendees).to eq [@hector, @toni, @zoey]
  end

  it '#craft_with_most_supplies' do
    expect(@event.craft_with_most_supplies).to eq "sewing"
  end

  it '#supply_list' do
    expect(@event.supply_list).to eq(["yarn", "scissors", "knitting_needles", "canvas", "paint_brush", "paints", "fabric", "thread", "sewing_needles"])
  end

  it '#attendees_by_craft_interest' do
    expect(@event.attendees_by_craft_interest).to eq({
      "knitting"=>[@toni,@zoey],
      "painting"=>[],
      "sewing"=>[@hector,@toni]
    })
  end

  it '#crafts_that_use' do
    expect(@event.crafts_that_use('scissors')).to eq [@knitting, @sewing]
    expect(@event.crafts_that_use('fire')).to eq []

  end
end