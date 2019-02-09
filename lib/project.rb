require 'forwardable'

class Project
  extend Forwardable

  attr_accessor :city, :start_date, :end_date

  def_delegators :city, :travel_day_cost
  def_delegators :city, :work_day_cost

  def initialize(city, start_date, end_date)
    @city = city
    @start_date = start_date
    @end_date = end_date
  end

  def range
    (start_date..end_date)
  end
end
