require 'rspec'
require './lib/event'

describe Event do
  before :each do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @zoey = Person.new({name: 'Zoey', interests: ['drawing', 'knitting', 'painting']})

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
      "painting"=>[@hector, @zoey],
      "sewing"=>[@hector,@toni]
    })
  end

  it '#crafts_that_use' do
    expect(@event.crafts_that_use('scissors')).to eq [@knitting, @sewing]
    expect(@event.crafts_that_use('fire')).to eq []
  end

  it '#assign_attendees_to_crafts' do
    @toni.add_supply('yarn', 30)
    @toni.add_supply('scissors', 2)
    @toni.add_supply('knitting_needles', 5)
    @toni.add_supply('fabric', 10)
    @toni.add_supply('scissors', 1)
    @toni.add_supply('thread', 2)
    @toni.add_supply('paint_brush', 10)
    @toni.add_supply('paints', 20)

    @zoey.add_supply('yarn', 20)
    @zoey.add_supply('scissors', 2)
    @zoey.add_supply('knitting_needles', 2)

    @hector.add_supply('fabric', 5)
    @hector.add_supply('scissors', 1)
    @hector.add_supply('thread', 1)
    @hector.add_supply('canvas', 5)
    @hector.add_supply('paint_brush', 10)
    @hector.add_supply('paints', 20)

    expect(@event.assign_attendees_to_crafts).to be_a Hash
    expect(@event.assign_attendees_to_crafts.keys).to eq [@knitting, @painting, @sewing]
    expect(@event.assign_attendees_to_crafts[@knitting]).to be_a Array
  end
end