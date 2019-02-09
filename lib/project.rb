class Project < Struct.new(:city, :start_date, :end_date)
  def range
    (start_date..end_date)
  end

  def length
    range.to_a.length
  end
end
