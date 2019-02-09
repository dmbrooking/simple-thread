require_relative './city'

class LowCostCity < City
  def travel_day_cost
    45
  end

  def work_day_cost
    75
  end
end
