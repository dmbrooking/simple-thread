class ProjectReimbursementCalculator
  attr_accessor :projects, :dates_and_rates

  def initialize(projects = [])
    @projects = projects
    total_range = (projects[0].start_date..projects[-1].end_date)
    @dates_and_rates = Hash[*total_range.collect { |v| [ v, 0 ] }.flatten]
  end

  def run
    prev_project = nil

    dates_and_rates.each_with_index do |(day, _rate), index|
      applied_project = projects.select { |p| p.range.include?(day) }[0]

      unless applied_project
        dates_and_rates[day-1] = prev_project.city.travel_day_cost
        prev_project = nil
        next
      end

      dates_and_rates[day] =
        if prev_project.nil? || index == dates_and_rates.size - 1
          applied_project.city.travel_day_cost
        else
          applied_project.city.work_day_cost
        end
      prev_project = applied_project
    end

    dates_and_rates.values.inject { |a, b| a + b }
  end
end
