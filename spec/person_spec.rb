require 'rspec'
require './lib/person.rb'

RSpec.describe Person do
  before :each do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  context '#initialize' do
    it 'exists' do
      expect(@person).to be_a Person
    end

    it 'has readable attributes' do
      expect(@person.name).to eq 'Hector'
      expect(@person.interests).to eq ['sewing', 'millinery', 'drawing']
      expect(@person.supplies).to eq ({})
    end
  end

  context 'Iteration 1' do
    it '#add_supply' do
      @person.add_supply('fabric', 4)
      @person.add_supply('scissors', 1)

      expect(@person.supplies).to eq({'fabric' => 4, 'scissors' => 1})

      @person.add_supply('fabric', 3)

      expect(@person.supplies).to eq({'fabric' => 7, 'scissors' => 1})
    end
  end
end
