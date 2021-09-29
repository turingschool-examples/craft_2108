require 'pry'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Craft do
  it "exists" do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    expect(craft).to be_an_instance_of(Craft)
  end

  xit "has a name" do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    expect(craft.name).to eq("knitting")
  end

  xit "has a list of required supplies" do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    expect(craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
  end
end
