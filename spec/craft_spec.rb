require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Craft do

  it 'exists' do
    craft = Craft.new('knitting',
        {yarn: 20, scissors: 1, knitting_needles: 2})
    expect(craft).to be_an_instance_of(Craft)
  end

  it 'has attributes' do
    craft = Craft.new('knitting',
        {yarn: 20, scissors: 1, knitting_needles: 2})
    expect(craft.name).to eq('knitting')
  end

  it 'can add supplies' do
      craft = Craft.new('knitting',
          {yarn: 20, scissors: 1, knitting_needles: 2})
      craft.add_supply(:yarn, 20)
      craft.add_supply(:scissors, 1)
      craft.add_supply(:knitting_needles, 2)
      expect(craft.supplies_required).to eq({yarn: 20, scissors: 1, knitting_needles: 2})
  end

end
