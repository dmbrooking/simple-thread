require_relative '../../lib/city'

RSpec.describe City do
  it { is_expected.to respond_to(:travel_day_cost) }
  it { is_expected.to respond_to(:work_day_cost) }
end
