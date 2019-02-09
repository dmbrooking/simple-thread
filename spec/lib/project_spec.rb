require_relative '../../lib/project'
require_relative '../../lib/low_cost_city'
require 'date'

RSpec.describe Project do
  it { is_expected.to respond_to(:city) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }

  it 'returns range of dates' do
    project = Project.new(LowCostCity.new, Date.today, Date.today + 4)
    expect(project.range).to eq((Date.today..Date.today + 4))
  end

  context '#length' do
    it 'returns 1 when start and end date are the same' do
      project = Project.new(LowCostCity.new, Date.today, Date.today)
      expect(project.length).to eq(1)
    end

    it 'returns correct number of days when start and end date are different' do
      project = Project.new(LowCostCity.new, Date.today, Date.today + 4)
      expect(project.length).to eq(5)
      project = Project.new(LowCostCity.new, Date.today, Date.today + 1)
      expect(project.length).to eq(2)
    end
  end
end
