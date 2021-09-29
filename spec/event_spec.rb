require './lib/event'
require './lib/craft'
require './lib/person'

RSpec.describe Event do
  before(:each) do
    @craft = Craft.new('knitting', {
      yarn: 20,
      scissors: 1,
      knitting_needles: 2
      })

    @sewing = Craft.new('sewing', {
      fabric: 5,
      scissors: 1,
      thread: 1,
      sewing_needles: 1})

    @knitting = Craft.new('knitting', {
      yarn: 20,
      scissors: 1,
      knitting_needles: 2})

    @painting = Craft.new('painting', {
      canvas: 1,
      paint_brush: 2,
      paints: 5})

    @person = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']
      })

    @hector = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']
      })
    @toni = Person.new({
      name: 'Toni',
      interests: ['sewing', 'knitting']})

    @zoey = Person.new({
      name: 'Zoey',
      interests: ['drawing', 'knitting']})

    @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @zoey])
  end

  it "exists" do
    expect(@event).to be_an_instance_of(Event)
  end

  it "has attributes" do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq([@knitting, @painting, @sewing])
    expect(@event.attendees).to eq([@hector, @toni, @zoey])
  end

  it "returns attendee_names" do
    expect(@event.attendee_names).to eq(["Hector", "Toni", "Zoey"])
  end

  it "returns craft_with_most_supplies" do
    expect(@event.craft_with_most_supplies).to eq("sewing")
  end

  xit "returns supply list" do
    expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  it "attendees_by_craft_interest" do
    expected = {
       "knitting"=>[@toni, @zoey],
       "painting"=>[],
       "sewing"=>[@hector, @toni]
      }
    expect(@event.attendees_by_craft_interest).to eq(expected)
  end

  it "crafts_that_use" do
    expect(@event.crafts_that_use('scissors')).to eq([@knitting, @sewing])
  end
end