require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'

describe Event do
  it 'exists' do
    craft = Craft.new('knitting',
      {yarn: 20,
        scissors: 1,
        knitting_needles: 2
        })
    person = Person.new({
          name: 'Hector',
          interests: ['sewing', 'millinery', 'drawing']
          })
    event = Event.new("Carla's Craft Connection", [craft], [person])

    expect(event).to be_a(Event)
  end

  it 'has attributes' do
    craft = Craft.new('knitting',
      {yarn: 20,
        scissors: 1,
        knitting_needles: 2
        })
    person = Person.new({
          name: 'Hector',
          interests: ['sewing', 'millinery', 'drawing']
          })
    event = Event.new("Carla's Craft Connection", [craft], [person])

    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([craft])
    expect(event.attendees).to eq([person])
  end

  it 'shows attendee names' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})

    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    expect(event.attendee_names).to eq(["Hector", "Toni"])
  end

  it 'shows highest supplied craft' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})

    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    expect(event.craft_with_most_supplies).to eq("sewing")
  end

  it 'provides supply list' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})

    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  it 'shows attendees by craft interest' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    zoey = Person.new({name: 'Zoey', interests: ['drawing', 'knitting']})

    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})

    event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, zoey])

    expected = {
                 "knitting"=>[toni, zoey],
                 "painting"=>[],
                 "sewing"=>[toni, hector]
                }

    expect(event.attendees_by_craft_interest).to eq(expected)
  end
end
