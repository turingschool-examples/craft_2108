require './lib/craft'
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
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(@person.supplies).to eq({})
  end

  describe '#add_supply' do
    it 'can add supply' do
      @person.add_supply('fabric', 4)
      @person.add_supply('scissors', 1)

      expect(@person.supplies).to eq({'fabric' => 4, 'scissors' => 1})

      @person.add_supply('fabric', 3)

      expect(@person.supplies).to eq({'fabric' => 7, 'scissors' => 1})
    end
  end

  describe '#can_build?' do
    it 'can tell if attendee has enough supplies required' do
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @hector = Person.new({
        name: 'Hector',
        interests: ['sewing', 'millinery', 'drawing']
      })

      expect(@hector.can_build?(@sewing)).to be false

      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)

      expect(@hector.can_build?(@sewing)).to be false

      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)

      expect(@hector.can_build?(@sewing)).to be true
    end
  end
end