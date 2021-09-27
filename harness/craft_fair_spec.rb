require 'rspec'
require 'pry'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe 'Craft Fair' do
  describe 'Iteration 1' do
    it '1. Person Creation' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(Person).to respond_to(:new).with(1).argument
      expect(person).to be_a(Person)
      expect(person.name).to eq('Hector')
      expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
      expect(person.supplies).to eq({})
    end

    it '2. Craft Creation' do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      expect(Craft).to respond_to(:new).with(2).argument
      expect(craft).to be_a(Craft)
      expect(craft.name).to eq('knitting')
      expect(craft.supplies_required).to eq({yarn: 20, scissors: 1, knitting_needles: 2})
    end

    it '3. Event Creation' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [craft], [person])

      expect(Event).to respond_to(:new).with(3).argument
      expect(event).to be_a(Event)
      expect(event.name).to eq("Carla's Craft Connection")
      expect(event.crafts).to eq([craft])
      expect(event.attendees).to eq([person])
    end

    it '4. Person #add_supply' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(person).to respond_to(:add_supply).with(2).argument

      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)
      person.add_supply('fabric', 3)

      expect(person.supplies).to eq({'fabric' => 7, 'scissors' => 1})
    end
  end

  describe 'Iteration 2' do
    before :each do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    end

    it '5. Event #attendee_names' do
      expect(@event).to respond_to(:attendee_names).with(0).argument
      expect(@event.attendee_names).to eq(['Hector', 'Toni'])
    end

    it '6. Event #craft_with_most_supplies' do
      expect(@event).to respond_to(:craft_with_most_supplies).with(0).argument
      expect(@event.craft_with_most_supplies).to eq('sewing')
    end

    it '7. Event #supply_list' do
      expect(@event).to respond_to(:supply_list).with(0).argument
      expect(@event.supply_list).to eq(['fabric', 'scissors', 'thread', 'sewing_needles', 'yarn', 'knitting_needles'])
    end

    it '8. Person #can_build?' do
      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)

      expect(@hector).to respond_to(:can_build?).with(1).argument
      expect(@hector.can_build?(@sewing)).to eq(false)

      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)

      expect(@hector.can_build?(@sewing)).to eq(true)
    end
  end

  describe 'Iteration 3' do
    before :each do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
    end

    it '9. Event #attendees_by_interest' do
      expect(@event).to respond_to(:attendees_by_craft_interest)

      expected = {
        'knitting' => [@toni, @tony],
        'sewing' => [@hector, @toni],
        'painting' => []
      }

      expect(@event.attendees_by_craft_interest).to eq(expected)
    end

    it '10. Event #crafts_that_use' do
      expect(@event).to respond_to(:crafts_that_use).with(1).argument

      expect(@event.crafts_that_use('fire')).to eq([])
      expect(@event.crafts_that_use('scissors')).to eq([@knitting, @sewing])
    end
  end

  describe 'Iteration 4' do
    before :each do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting', 'painting']})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      @toni.add_supply('yarn', 30)
      @toni.add_supply('scissors', 2)
      @toni.add_supply('knitting_needles', 5)
      @toni.add_supply('fabric', 10)
      @toni.add_supply('scissors', 1)
      @toni.add_supply('thread', 2)
      @toni.add_supply('paint_brush', 10)
      @toni.add_supply('paints', 20)
      @tony.add_supply('yarn', 20)
      @tony.add_supply('scissors', 2)
      @tony.add_supply('knitting_needles', 2)
      @hector.add_supply('fabric', 5)
      @hector.add_supply('scissors', 1)
      @hector.add_supply('thread', 1)
      @hector.add_supply('canvas', 5)
      @hector.add_supply('paint_brush', 10)
      @hector.add_supply('paints', 20)
      @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
    end

    it '11. Event #assign_attendees_to_crafts' do
      expect(@event).to respond_to(:assign_attendees_to_crafts).with(0).argument

      expect(@event.assign_attendees_to_crafts[@painting].include?(@toni) || @event.assign_attendees_to_crafts[@painting].include?(@tony)).to eq(false)
      expect(@event.assign_attendees_to_crafts[@knitting].include?(@hector)).to eq(false)
      expect(@event.assign_attendees_to_crafts[@sewing].include?(@tony)).to eq(false)
      @event.assign_attendees_to_crafts[@knitting].each do |person|
        expect(person).to be_a(Person)
      end
    end
  end
end
