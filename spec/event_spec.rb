
 require './lib/person'
 require './lib/craft'
 require './lib/event'

 RSpec.describe do
   it 'exists' do
     craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
     person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
     event = Event.new("Carla's Craft Connection", [craft], [person])
     expect(event).to be_an_instance_of(Event)
     expect(event.name).to eq("Carla's Craft Connection")
     # expect(event.crafts).to eq([craft])
     # expect(event.attendees).to eq([person])
   end
 end
