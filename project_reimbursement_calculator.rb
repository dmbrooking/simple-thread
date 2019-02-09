class ProjectReimbursementCalculator
  attr_accessor :projects
  attr_accessor :dates_and_rates
  attr_accessor :current_day

  def initialize(projects = [])
    @projects = projects
    @dates_and_rates = Hash[*total_range.collect { |v| [v, 0] }.flatten]
    @project_for_day = {}
    @current_day = nil
  end

  def run
    dates_and_rates.each do |d, _r|
      @current_day = d

      next unless current_project

      dates_and_rates[current_day] = if no_work_yesterday_or_tomorrow?
                                       current_project.travel_day_cost
                                     else
                                       current_project.work_day_cost
                                     end
    end

    dates_and_rates.values.inject { |a, b| a + b }
  end

  private

  def total_range
    (projects[0].start_date..projects[-1].end_date)
  end

  def project_for(day)
    @project_for_day[day] ||= projects.select { |p| p.range.include?(day) }[0]
  end

  def prev_project
    project_for(current_day - 1)
  end

  def current_project
    project_for(current_day)
  end

  def next_project
    project_for(current_day + 1)
  end

  def no_work_yesterday_or_tomorrow?
    prev_project.nil? || next_project.nil?
  end
end
