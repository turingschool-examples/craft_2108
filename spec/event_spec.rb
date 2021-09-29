require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do

  it 'exists' do
    @event = Event.new("Carla's Craft Connection", @craft, @person)
    expect(@event).to be_an_instance_of(Event)
  end

  it 'can have crafts and people' do
    @event = Event.new("Carla's Craft Connection", @craft, @person)

    hector = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({
      name: 'Toni',
      interests: ['sewing', 'knitting']})
    sewing = Craft.new(
        'sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new(
        'knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event.add_craft(sewing)
    @event.add_craft(knitting)
    @event.add_person(hector)
    @event.add_person(toni)

    expect(@event.craft).to eq([sewing, knitting])
    expect(@event.person).to eq([hector, toni])
  end

  it 'can return atendee names' do
    @event = Event.new("Carla's Craft Connection", @craft, @person)

    hector = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({
      name: 'Toni',
      interests: ['sewing', 'knitting']})
    sewing = Craft.new(
        'sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new(
        'knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event.add_craft(sewing)
    @event.add_craft(knitting)
    @event.add_person(hector)
    @event.add_person(toni)

    expect(@event.attendee_names).to eq(["Hector", "Toni"])
  end

  it 'can return craft with most supplies' do
    @event = Event.new("Carla's Craft Connection", @craft, @person)

    hector = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({
      name: 'Toni',
      interests: ['sewing', 'knitting']})
    sewing = Craft.new(
        'sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new(
        'knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event.add_craft(sewing)
    @event.add_craft(knitting)
    @event.add_person(hector)
    @event.add_person(toni)

    expect(@event.craft_with_most_supplies).to eq([knitting])
  end


end
