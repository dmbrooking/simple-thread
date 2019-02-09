require_relative '../../lib/high_cost_city'

RSpec.describe HighCostCity do
  subject { HighCostCity.new }
  it 'sets travel_day_cost to 55' do
    expect(subject.travel_day_cost).to eq(55)
  end

  it 'sets work_day_cost to 85' do
    expect(subject.work_day_cost).to eq(85)
  end
end
