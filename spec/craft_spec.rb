require 'rspec'
require './lib/person'
require './lib/craft'

describe Craft do
  it 'exists' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    expect(craft).to be_an_instance_of(Craft)
  end

  it 'attributes' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    supplies_required = {yarn: 20, scissors: 1, knitting_needles: 2}
    expect(craft.name).to eq('knitting')
    expect(craft.supplies_required).to eq(supplies_required)
  end

  # it 'does things' do
  #   info = {
  #             key: 'value',
  #             key2: 'value2'
  #           }
  #
  #   info_2 = {
  #             key: 'value',
  #             key2: 'value2'
  #           }
  #
  #   thing = Thing.new(info)
  #   thing2 = Thing2.new(info_2)
  #   whatever = Whatever.new(what, ever)
  #
  #   expect(whatever.gidgets).to eq([])
  #
  #   whatever.add_thing(thing)
  #   whatever.add_thing(thing2)
  #
  #   expect(whatever.gidgets).to eq([thing, thing2])
  # end
end
