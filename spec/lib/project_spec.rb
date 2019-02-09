require_relative '../../lib/project'

RSpec.describe Project do
  subject { build(:project) }
  it { is_expected.to respond_to(:city) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:end_date) }

  it 'returns range of dates' do
    project = build(:project)
    expect(project.range).to eq((project.start_date..project.end_date))
  end
end
