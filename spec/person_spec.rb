require "rspec"
require "./lib/person"

describe Person do
  before(:each) do
   @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end
  it 'exists' do
   expect(@person).to be_a(Person)
  end

  it 'attributes' do
    expect(@person.name).to eq("Hector")
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(@person.supplies).to eq({})
  end

  it '#add_supply' do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)

    expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})

    @person.add_supply('fabric', 3)
    expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end
end
describe 'Iteration 2' do
  before(:each) do
   @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
   @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
   @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
   @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it '#can_build' do
    expect(@hector.can_build?(@sewing)).to be false
    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)
    expect(@hector.can_build?(@sewing)).to be false
    @hector.add_supply('scissors', 1)
    @hector.add_supply('sewing needles', 1)
    expect(@hector.can_build?(@sewing)).to be true
  end
end
