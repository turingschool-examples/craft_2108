require 'rspec'
require './lib/craft'

describe Craft do
  let(:craft) { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2}) }

  describe '#initialize' do
    it 'exists' do
      expect(craft).to be_a Craft
    end

    it 'has a name' do
      expect(craft.name).to eq('knitting')
    end

    it 'has supplies required' do
      expected = {yarn: 20, scissors: 1, knitting_needles: 2}
      
      expect(craft.supplies_required).to eq(expected)
    end
  end
end
