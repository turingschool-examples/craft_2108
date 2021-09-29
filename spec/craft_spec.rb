require './lib/craft'
require './lib/person'

RSpec.describe Craft do
  before(:each) do
    @craft = Craft.new('knitting',
                       { yarn: 20, scissors: 1, knitting_needles: 2 })
  end

  it 'exists' do
    expect(@craft).to be_a(Craft)
  end

  it 'has attributes' do
    expect(@craft.name).to eq('knitting')
    expect(@craft.supplies_required).to eq({ yarn: 20, scissors: 1,
                                             knitting_needles: 2 })
  end

  it 'can determine supply count' do
    expect(@craft.supply_count).to eq(3)
  end
  
  it 'can return supply names' do
    expect(@craft.supply_names).to eq(['yarn', 'scissors', 'knitting_needles'])
  end
end
