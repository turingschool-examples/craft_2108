require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'
describe Event do
  describe '#initialize' do
    it 'creates an instance of Event' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection",[craft], [person])

      expect(event).to be_an_instance_of(Event)
    end

    it 'has readable attributes' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection",[craft], [person])

      expect(event.name).to eq("Carla's Craft Connection")
      expect(event.crafts).to eq([craft])
      expect(event.attendees).to eq([person])
    end
  end

  describe '#attendee_names' do
    it 'creates an array of attendee names' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

      expect(event.attendee_names).to eq(["Hector", "Toni"])
    end
  end

  describe '#craft_with_the_most_supplies' do
    it 'returns the name of the craft that requires the most supply types' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

      expect(event.craft_with_the_most_supplies).to eq("sewing")
    end
  end

  describe '#supply_list' do
    it 'returns a unique list of supplies at the event' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

      expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end
  end

  describe '#attendees_by_craft_interest' do
    it 'returns a hash of craft names names and attendees who are interested' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      zoey = Person.new({name: 'Zoey', interests: ['drawing', 'knitting']})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, zoey])
      expected = {
        "knitting" => [toni, zoey],
        "painting" => [],
        "sewing" => [hector,toni]
      }

      expect(event.attendees_by_craft_interest).to eq(expected)
    end
  end

  describe '#crafts_that_use' do
    it 'returns an array of crafts that use supply' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      zoey = Person.new({name: 'Zoey', interests: ['drawing', 'knitting']})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, zoey])

      expect(event.crafts_that_use('scissors')).to eq([knitting,sewing])
      expect(event.crafts_that_use('fire')).to eq([])
    end
  end
end
