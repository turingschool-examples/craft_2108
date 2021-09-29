require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  it "exists and attributes" do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.craft).to eq([craft])
    expect(event.person).to eq([person])
  end

end



