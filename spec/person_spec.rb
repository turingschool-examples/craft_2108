require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
  it 'exists' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person).to be_a(Person)
  end

  it 'has a name' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person.name).to eq("Hector")
  end

  it 'has interests' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person.interests).to eq(["sewing", "millinery", "drawing"])
  end

  it 'starts with no supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person.supplies).to eq({})
  end

  it 'can add supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    person.add_supply('fabric', 4)
    person.add_supply('scissors', 1)

    results = {
              'fabric' => 4,
              'scissors' => 1
              }
    expect(person.supplies).to eq(results)
  end

  it 'can add more supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    person.add_supply('fabric', 4)
    person.add_supply('scissors', 1)
    person.add_supply('fabric', 3)

    results = {
              'fabric' => 7,
              'scissors' => 1
              }
    expect(person.supplies).to eq(results)
  end
end
