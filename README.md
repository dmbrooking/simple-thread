# Simple Thread Programming Exercise

### Assumptions
* Projects are in chronological order. Future enhancement would be to sort array of projects by end_date.
* If there exist multiple projects with the same start date, the first one encountered is used.

### How To Run
```
require_relative './lib/project'
require_relative './lib/low_cost_city'
require_relative './lib/high_cost_city'
require_relative './project_reimbursement_calculator'
require 'date'

project1 = Project.new(LowCostCity.new, Date.new(2015, 9, 1), Date.new(2015, 9, 1))
project2 = Project.new(HighCostCity.new, Date.new(2015, 9, 2), Date.new(2015, 9, 6))
project3 = Project.new(LowCostCity.new, Date.new(2015, 9, 6), Date.new(2015, 9, 8))

ProjectReimbursementCalculator.new([project1, project2, project3]).run
 => 590
```

### Specs
```
> bundle install
> rspec

HighCostCity
  sets travel_day_cost to 55
  sets work_day_cost to 85

LowCostCity
  sets travel_day_cost to 45
  sets work_day_cost to 75

Project
  should respond to #city
  should respond to #start_date
  should respond to #end_date
  returns range of dates

ProjectReimbursementCalculator
  runs set #1 as expected
  runs set #2 as expected
  runs set #3 as expected
  runs set #4 as expected
  #total_range
    returns range for all projects
  #project_for
    returns project for the day when only one project matches
    returns first project for the day when more than one project matches
    returns prev, current, and next project for given day
  #no_work_yesterday_or_tomorrow?
    returns true if no projects for yesterday and tomorrow
    returns true if project defined for yesterday
    returns true if project defined for tomorrow
    returns false if project defined for yesterday and tomorrow

Finished in 0.0182 seconds (files took 0.16417 seconds to load)
20 examples, 0 failures
```