require 'forwardable'

class Project < Struct.new(:city, :start_date, :end_date)
  extend Forwardable

  def range
    (start_date..end_date)
  end

  def length
    range.to_a.length
  end

  def_delegators :city, :travel_day_cost
  def_delegators :city, :work_day_cost
end
