require 'rspec'
require './lib/event'

describe Event do
  let(:knitting) { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2}) }
  let(:sewing) { Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1}) }
  let(:painting) { Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5}) }
  let(:hector) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
  let(:toni) { Person.new({name: 'Toni', interests: ['sewing', 'knitting']}) }
  let(:zoey) { Person.new({name: 'Zoey', interests: ['drawing', 'knitting']}) }
  let(:event) { Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, zoey]) }

  describe '#initialize' do
    it 'exists' do
      expect(event).to be_an Event
    end

    it 'has a name' do
      expect(event.name).to eq("Carla's Craft Connection")
    end

    it 'has crafts' do
      expect(event.crafts).to eq([knitting, painting, sewing])
    end

    it 'has attendees' do
      expect(event.attendees).to eq([hector, toni, zoey])
    end
  end

  describe '#attendee_names' do
    it 'returns an array of attendee_names' do
      expect(event.attendee_names).to eq(["Hector", "Toni", "Zoey"])
    end
  end

  describe '#craft_with_most_supplies' do
    it 'returns the craft_with_most_supplies' do
      expect(event.craft_with_most_supplies).to eq(sewing)
    end
  end

  describe '#supply_list' do
    it 'returns an array of supplies needed' do
      expected = ["yarn", "scissors", "knitting_needles", "canvas",
      "paint_brush", "paints", "fabric", "thread", "sewing_needles"]

      expect(event.supply_list).to eq(expected)
    end
  end

  describe '#attendees_by_craft_interest' do
    it 'returns an hash of attendees_by_craft_interest' do
      expected = {
      "knitting"=>[toni, zoey],
      "painting"=>[],
      "sewing"=>[hector, toni]
      }
      expect(event.attendees_by_craft_interest).to eq(expected)
    end
  end

  describe '#crafts_that_use' do
    it 'returns crafts that use given argument' do
      expect(event.crafts_that_use('scissors')).to eq([knitting, sewing])
      expect(event.crafts_that_use('fire')).to eq([])
    end
  end

  # this is not done
  describe '#assign_attendees_to_crafts' do
    xit 'returns a hash with crafts and attendees asigned to them' do
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

      expect(event.assign_attendees_to_crafts.keys).to include(knitting, painting, sewing)
      expect(event.assign_attendees_to_crafts.values).to include(hector, toni, zoey)
    end
  end
end
