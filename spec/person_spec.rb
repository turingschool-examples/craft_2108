require './lib/person'
require 'rspec'

describe Person do
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  it 'has readable attributes' do
    expect(@hector.name).to eq('Hector')
    expect(@hector.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(@hector.supplies).to eq({})
  end

  describe '#add_supply' do
    it 'adds a supply and a given count to the given individual' do
      @hector.add_supply('fabric', 4)
      @hector.add_supply('scissors', 1)

      expect(@hector.supplies).to eq({'fabric' => 4, 'scissors' => 1})

      @hector.add_supply('fabric', 3)

      expect(@hector.supplies).to eq({'fabric' => 7, 'scissors' => 1})
    end
  end

  describe '#can_build' do
    it 'checks if person can build given craft' do
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})

      expect(@hector.can_build?(sewing)).to eq(false)

      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)

      expect(@hector.can_build?(sewing)).to eq(false)

      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)

      expect(@hector.can_build?(sewing)).to eq(true)

    end
  end
end
