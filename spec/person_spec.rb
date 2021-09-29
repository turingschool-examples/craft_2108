require './lib/person'
require './lib/craft'
RSpec.describe Person do
  before(:each) do
    @person = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']
      })
    @hector = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']
      })
    @toni = Person.new({
      name: 'Toni',
      interests: ['sewing', 'knitting']})

    @sewing = Craft.new('sewing', {
      fabric: 5,
      scissors: 1,
      thread: 1,
      sewing_needles: 1})
    @knitting = Craft.new('knitting', {
      yarn: 20,
      scissors: 1,
      knitting_needles: 2})

  end

  it "exists" do
    expect(@person).to be_an_instance_of(Person)
    expect(@hector).to be_an_instance_of(Person)
    expect(@toni).to be_an_instance_of(Person)
  end

  it "has attributes" do
    expect(@person.name).to eq("Hector")
    expect(@person.interests).to eq(["sewing", "millinery", "drawing"])
  end

  it "has empty hash supply" do
    expect(@person.supplies).to eq({})
  end

  it "can add_supply" do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)

    expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})

    @person.add_supply('fabric', 3)
    expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end

  it "shows if hector.can_build?" do
    expect(@hector.can_build?(@sewing)).to eq(false)
    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)
    expect(@hector.can_build?(@sewing)).to eq(false)
    @hector.add_supply('scissors', 1)
    @hector.add_supply('sewing_needles', 1)
    expect(@hector.can_build?(@sewing)).to eq(true)

  end

end