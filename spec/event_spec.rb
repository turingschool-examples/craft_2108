require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @sewing = Craft.new('sewing',
                        { fabric: 5, scissors: 1, thread: 1,
                          sewing_needles: 1 })
    @knitting = Craft.new('knitting',
                          { yarn: 20, scissors: 1, knitting_needles: 2 })
    @painting = Craft.new('painting',
                          { canvas: 1, paint_brush: 2, paints: 5 })
    @hector = Person.new({ name: 'Hector',
                           interests: %w[sewing millinery drawing] })
    @toni = Person.new({ name: 'Toni', interests: %w[sewing knitting] })
    @zoey = Person.new({ name: 'Zoey', interests: %w[drawing knitting] })
  end

  it 'exists' do
    event = Event.new("Carla's Craft Connection", [@knitting], [@hector])
    expect(event).to be_an(Event)
  end

  it 'has attributes' do
    event = Event.new("Carla's Craft Connection", [@knitting], [@hector])
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([@knitting])
    expect(event.attendees).to eq([@hector])
  end

  it 'can list attendee names' do
    event = Event.new("Carla's Craft Connection", [@sewing, @knitting],
                      [@hector, @toni])
    expect(event.attendee_names).to eq(%w[Hector Toni])
  end

  it 'can determine craft with most supplies' do
    event = Event.new("Carla's Craft Connection", [@sewing, @knitting],
                      [@hector, @toni])
    expect(event.craft_with_most_supplies).to eq('sewing')
  end

  it 'can return supply list' do
    event = Event.new("Carla's Craft Connection", [@sewing, @knitting],
                      [@hector, @toni])
    expect(event.supply_list).to eq(%w[fabric scissors thread
                                       sewing_needles yarn knitting_needles])
  end

  it 'can make a hash of crafts' do
    event = Event.new("Carla's Craft Connection",
                      [@knitting, @painting, @sewing], [@hector, @toni, @zoey])
    expect(event.craft_hash).to eq({ 'knitting' => [], 'painting' => [],
                                     'sewing' => [] })
  end

  it 'can return attendees by craft interest' do
    event = Event.new("Carla's Craft Connection",
                      [@knitting, @painting, @sewing], [@hector, @toni, @zoey])
    expected = { 'knitting' => [@toni, @zoey], 'painting' => [],
                 'sewing' => [@hector, @toni] }

    expect(event.attendees_by_craft_interest).to eq(expected)
  end

  it 'can return crafts that use item' do
    event = Event.new("Carla's Craft Connection",
                      [@knitting, @painting, @sewing], [@hector, @toni, @zoey])
    expect(event.crafts_that_use('scissors')).to eq([@knitting,
                                                     @sewing])
    expect(event.crafts_that_use('fire')).to eq([])
  end
end
