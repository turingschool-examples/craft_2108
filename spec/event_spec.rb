require './lib/person'
require './lib/craft'
require './lib/event'
require 'rspec'

RSpec.describe Event do

  context 'iteration 1' do
    before(:each) do
      @person = Person.new({
                        name: 'Hector',
                        interests: ['sewing', 'millinery', 'drawing']
                        })
      @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @event = Event.new("Carla's Craft Connection", [@craft], [@person])
    end

    it 'exists with attributes' do
      expect(@event.name).to eq("Carla's Craft Connection")
      expect(@event.crafts).to eq([@craft])
      expect(@event.attendees).to eq([@person])
    end
  end

  context 'iteration 2' do

    before(:each) do
      @hector = Person.new({
                        name: 'Hector',
                        interests: ['sewing', 'millinery', 'drawing']
                        })
      @toni   = Person.new({
                        name: 'Toni',
                        interests: ['sewing', 'knitting']
                        })
      @sewing   = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    end

    it '#attendee_names' do
      expect(@event.attendee_names).to eq(["Hector", "Toni"])
    end

    it '#craft_with_most_supplies' do
      expect(@event.craft_with_most_supplies).to eq("sewing")
    end

    it "#supply_list" do
      expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end

    xit "#can_build?" do
      expect(@hector.can_build?(@sewing)).to be false

      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)
      expect(@hector.can_build?(@sewing)).to be false

      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)
              require 'pry'; binding.pry
      expect(@hector.can_build?(@sewing)).to be true
    end
  end

  context 'iteration 3' do

    before(:each) do
      @hector = Person.new({
                        name: 'Hector',
                        interests: ['sewing', 'millinery', 'drawing']
                        })
      @toni   = Person.new({
                        name: 'Toni',
                        interests: ['sewing', 'knitting']
                        })
      @zoey   = Person.new({
                        name: 'Zoey',
                        interests: ['drawing', 'knitting']
                        })

      @sewing   = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})

      @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @zoey])
    end

    xit "#attendees_by_craft_interest" do
      expected = {
                    "knitting"=>[@tony, @zoey],
                    "painting"=>[],
                    "sewing"=>[@hector, @tony]
                  }
      expect(@event.attendees_by_craft_interest).to eq(expected)
    end
  end
end
