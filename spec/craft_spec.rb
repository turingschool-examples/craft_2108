require './lib/craft'
require 'rspec'

describe Craft do
  before(:each) do
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it 'has readable attributes' do
    expect(@knitting.name).to eq('knitting')
    expect(@knitting.supplies_required).to eq({yarn: 20, scissors: 1, knitting_needles: 2})
  end

  describe 'materials_required' do
    it 'returns all materials required for a given craft' do
      expect(@knitting.materials_required).to eq([:yarn, :scissors, :knitting_needles])
    end
  end
end
