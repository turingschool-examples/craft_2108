require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do

  it "exists and attributes" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person).to be_a(Person)
    expect(person.name).to eq('Hector')
    expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
  end

  it "has no supplies by default" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person.supplies).to eq({})
  end

end