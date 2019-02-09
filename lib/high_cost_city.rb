require_relative './city'

class HighCostCity < City
  def travel_day_cost
    55
  end

  def work_day_cost
    85
  end
end
