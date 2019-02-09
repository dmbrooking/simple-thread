require_relative '../../lib/low_cost_city'

RSpec.describe LowCostCity do
  subject { LowCostCity.new }
  it 'sets travel_day_cost to 45' do
    expect(subject.travel_day_cost).to eq(45)
  end

  it 'sets work_day_cost to 75' do
    expect(subject.work_day_cost).to eq(75)
  end
end
