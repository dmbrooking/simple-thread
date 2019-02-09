require_relative '../lib/project'
require_relative '../lib/low_cost_city'
require_relative '../lib/high_cost_city'
require_relative '../project_reimbursement_calculator'
require 'date'

RSpec.describe ProjectReimbursementCalculator do
  it 'runs set #1 as expected' do
    project1 = Project.new(LowCostCity.new, Date.new(2015, 9, 1), Date.new(2015, 9, 3))
    calc = ProjectReimbursementCalculator.new([project1])
    expect(calc.run).to eq(165)
  end

  it 'runs set #2 as expected' do
    project1 = Project.new(LowCostCity.new, Date.new(2015, 9, 1), Date.new(2015, 9, 1))
    project2 = Project.new(HighCostCity.new, Date.new(2015, 9, 2), Date.new(2015, 9, 6))
    project3 = Project.new(LowCostCity.new, Date.new(2015, 9, 6), Date.new(2015, 9, 8))
    calc = ProjectReimbursementCalculator.new([project1, project2, project3])
    expect(calc.run).to eq(590)
  end

  it 'runs set #3 as expected' do
    project1 = Project.new(LowCostCity.new, Date.new(2015, 9, 1), Date.new(2015, 9, 3))
    project2 = Project.new(HighCostCity.new, Date.new(2015, 9, 5), Date.new(2015, 9, 7))
    project3 = Project.new(HighCostCity.new, Date.new(2015, 9, 8), Date.new(2015, 9, 8))
    calc = ProjectReimbursementCalculator.new([project1, project2, project3])
    expect(calc.run).to eq(445)
  end

  it 'runs set #4 as expected' do
    project1 = Project.new(LowCostCity.new, Date.new(2015, 9, 1), Date.new(2015, 9, 1))
    project2 = Project.new(LowCostCity.new, Date.new(2015, 9, 1), Date.new(2015, 9, 1))
    project3 = Project.new(HighCostCity.new, Date.new(2015, 9, 2), Date.new(2015, 9, 2))
    project4 = Project.new(HighCostCity.new, Date.new(2015, 9, 2), Date.new(2015, 9, 3))
    calc = ProjectReimbursementCalculator.new([project1, project2, project3, project4])
    expect(calc.run).to eq(185)
  end
end
