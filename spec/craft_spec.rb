require 'rspec'
require './lib/craft.rb'

RSpec.describe Craft do
  before :each do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  context '#initialize' do
    it 'exists' do
      expect(@craft).to be_a Craft
    end

    it 'has readable attributes' do
      expect(@craft.name).to eq 'knitting'
      expect(@craft.supplies_required).to eq({
        :yarn=>20,
        :scissors=>1,
        :knitting_needles=>2
      })
    end
  end
end
