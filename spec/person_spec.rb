require 'rspec'
require './lib/person'
require './lib/craft'

describe Person do
  let(:hector) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
  let(:sewing) { Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1}) }

  describe '#initialize' do
    it 'exists' do
      expect(hector).to be_a Person
    end

    it 'has a name' do
      expect(hector.name).to eq('Hector')
    end

    it 'has interests' do
      expect(hector.interests).to eq(['sewing', 'millinery', 'drawing'])
    end

    it 'starts with empty supplies' do
      expect(hector.supplies).to eq({})
    end
  end

  describe '#add_supply' do
    it 'adds a supply' do
      hector.add_supply('fabric', 4)
      hector.add_supply('scissors', 1)

      expect(hector.supplies).to eq({"fabric"=>4, "scissors"=>1})

      hector.add_supply('fabric', 3)

      expect(hector.supplies).to eq({"fabric"=>7, "scissors"=>1})
    end
  end

  describe '#can_build?' do
    it 'checks if the person has the supplys to do a craft' do
      expect(hector.can_build?(sewing)).to be false

      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)

      expect(hector.can_build?(sewing)).to be false

      hector.add_supply('scissors', 1)
      hector.add_supply('sewing_needles', 1)

      expect(hector.can_build?(sewing)).to be true
    end
  end
end
