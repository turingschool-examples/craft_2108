require 'rspec'
require './lib/craft'

describe Craft do
  before :each do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it 'is an instance of Craft' do
    expect(@craft).to be_a Craft
  end

  it '#name' do
    expect(@craft.name).to eq 'knitting'
  end

  it '#supplies_required' do
    expect(@craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
  end
end