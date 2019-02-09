require_relative '../project_reimbursement_calculator'
require 'date'

# rubocop:disable Metrics/BlockLength
RSpec.describe ProjectReimbursementCalculator do
  it 'runs set #1 as expected' do
    calc = ProjectReimbursementCalculator.new(build(:set, :set1))
    expect(calc.run).to eq(165)
  end

  it 'runs set #2 as expected' do
    calc = ProjectReimbursementCalculator.new(build(:set, :set2))
    expect(calc.run).to eq(590)
  end

  it 'runs set #3 as expected' do
    calc = ProjectReimbursementCalculator.new(build(:set, :set3))
    expect(calc.run).to eq(445)
  end

  it 'runs set #4 as expected' do
    calc = ProjectReimbursementCalculator.new(build(:set, :set4))
    expect(calc.run).to eq(185)
  end

  describe('#total_range') do
    it('returns range for all projects') do
      project1 = build(:project, :low_cost, start_date: Date.new(2015, 9, 1), end_date: Date.new(2015, 9, 1))
      project2 = build(:project, :low_cost, start_date: Date.new(2015, 9, 5), end_date: Date.new(2015, 9, 6))
      calc = ProjectReimbursementCalculator.new([project1])
      expect(calc.send(:total_range)).to eq(project1.start_date..project1.end_date)
      calc = ProjectReimbursementCalculator.new([project1, project2])
      expect(calc.send(:total_range)).to eq(project1.start_date..project2.end_date)
    end
  end

  describe('#project_for') do
    it('returns project for the day when only one project matches') do
      project1 = build(:project, :low_cost, start_date: Date.new(2015, 9, 1), end_date: Date.new(2015, 9, 3))
      calc = ProjectReimbursementCalculator.new([project1])
      expect(calc.send(:project_for, Date.new(2015, 9, 2))).to eq(project1)
    end

    it('returns first project for the day when more than one project matches') do
      project1 = build(:project, :low_cost, start_date: Date.new(2015, 9, 1), end_date: Date.new(2015, 9, 3))
      project2 = build(:project, :low_cost, start_date: Date.new(2015, 9, 3), end_date: Date.new(2015, 9, 6))
      calc = ProjectReimbursementCalculator.new([project1, project2])
      expect(calc.send(:project_for, Date.new(2015, 9, 3))).to eq(project1)
    end

    it('returns prev, current, and next project for given day') do
      project1 = build(:project, :low_cost, start_date: Date.new(2015, 9, 1), end_date: Date.new(2015, 9, 1))
      project2 = build(:project, :low_cost, start_date: Date.new(2015, 9, 2), end_date: Date.new(2015, 9, 2))
      project3 = build(:project, :low_cost, start_date: Date.new(2015, 9, 3), end_date: Date.new(2015, 9, 3))
      calc = ProjectReimbursementCalculator.new([project1, project2, project3])
      calc.instance_variable_set(:@current_day, Date.new(2015, 9, 2))

      expect(calc.send(:prev_project)).to eq(project1)
      expect(calc.send(:current_project)).to eq(project2)
      expect(calc.send(:next_project)).to eq(project3)
    end
  end

  describe('#no_work_yesterday_or_tomorrow?') do
    it('returns true if no projects for yesterday and tomorrow') do
      calc = ProjectReimbursementCalculator.new([])
      calc.instance_variable_set(:@current_day, Date.new(2015, 9, 2))
      expect(calc.send(:no_work_yesterday_or_tomorrow?)).to be_truthy
    end

    it('returns true if project defined for yesterday') do
      project1 = build(:project, :low_cost, start_date: Date.new(2015, 9, 1), end_date: Date.new(2015, 9, 1))
      calc = ProjectReimbursementCalculator.new([project1])
      calc.instance_variable_set(:@current_day, Date.new(2015, 9, 2))
      expect(calc.send(:no_work_yesterday_or_tomorrow?)).to be_truthy
    end

    it('returns true if project defined for tomorrow') do
      project1 = build(:project, :low_cost, start_date: Date.new(2015, 9, 3), end_date: Date.new(2015, 9, 3))
      calc = ProjectReimbursementCalculator.new([project1])
      calc.instance_variable_set(:@current_day, Date.new(2015, 9, 2))
      expect(calc.send(:no_work_yesterday_or_tomorrow?)).to be_truthy
    end

    it('returns false if project defined for yesterday and tomorrow') do
      project1 = build(:project, :low_cost, start_date: Date.new(2015, 9, 1), end_date: Date.new(2015, 9, 1))
      project2 = build(:project, :low_cost, start_date: Date.new(2015, 9, 3), end_date: Date.new(2015, 9, 3))
      calc = ProjectReimbursementCalculator.new([project1, project2])
      calc.instance_variable_set(:@current_day, Date.new(2015, 9, 2))
      expect(calc.send(:no_work_yesterday_or_tomorrow?)).to be_falsey
    end
  end
end
# rubocop:enable Metrics/BlockLength
