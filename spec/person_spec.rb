require './lib/person'
require 'rspec'

describe Person do
  before :each do
    @person = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']
    })
  end

  it 'exists' do
    expect(@person).to be_a Person
  end

  it 'has readable attributes' do
    expect(@person.name).to eq('Hector')
    expect(@person.interests).to eq(['sewing', 'millenery', 'drawing'])
  end 
end