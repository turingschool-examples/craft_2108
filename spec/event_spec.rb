require 'pry'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  it "exits" do
    event = Event.new("Carla's Craft Connection", [craft], [person])
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    event.add_crafts(craft)
    event.add_attendees(person)
    expect(event).to be_an_instance_of(Event)
  end

  xit "has a name" do
    event = Event.new("Carla's Craft Connection", [craft], [person])
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(event.name).to eq("Carla's Craft Connection")
  end

    xit "has a list of crafts" do
    event = Event.new("Carla's Craft Connection", [craft], [person])
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    expect(event.crafts).to eq([craft])
  end

   xit "has a list of attendees" do
     event = Event.new("Carla's Craft Connection", [craft], [person])
     person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

     expect(event.attendees).to eq([person])
   end
end
