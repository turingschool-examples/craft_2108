require './lib/person'

RSpec.describe Person do
  it '#exists' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person).to be_an_instance_of Person
  end
end